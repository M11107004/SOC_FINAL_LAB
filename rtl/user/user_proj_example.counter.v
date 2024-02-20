// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32,
    parameter DELAYS=10,
    parameter N = 10
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);

    // IO
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign irq = 3'b000;	// Unused
    
    
    wire clk;
    wire rst;    
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;

    // WB MI A
    assign wbs_dat_o = (!prefetch_area) ? user_bram_o:
                       (prefetch_area) ? prefetch_data:0;
    assign wbs_ack_o = (!prefetch_area) ? nomal_ack :
                       (prefetch_area) ? prefetch_ack:0;
    wire request_user_bram;
    assign request_user_bram = (wbs_stb_i & wbs_cyc_i &(wbs_adr_i[31:20] == 12'h380)) ? 1 : 0;    
    
    // inputs to ram
    wire [31:0] ram_address;
    wire [31:0] ram_data;
    wire [3:0] ram_wren;
    wire ram_en;
    
    assign ram_address 	= (request_user_bram)? (wbs_adr_i + (prefetch_cnt<<2)):0;
    assign ram_data    	= (request_user_bram)? wbs_dat_i:0;
    assign ram_wren 	= (request_user_bram)? (wbs_sel_i & {4{wbs_we_i}}):4'b0;    
    assign ram_en   	= (request_user_bram)? 1:0;

    wire ram_ack;
    wire [31:0] user_bram_o;
    wire ram_we;
    wire [3:0] ram_sel;
    assign ram_we    	= (request_user_bram)? wbs_we_i :0;
    assign ram_sel   	= (request_user_bram)? wbs_sel_i :0;

    /////////////
    //prefetch
    /////////////

    //prefetch_area
    wire prefetch_area;
    assign prefetch_area = (((wbs_adr_i > prefetch_first_addr) && (wbs_adr_i <= (prefetch_first_addr + 32'd36))) && !ram_we && request_user_bram)  ? 1 : 0;
    reg[31:0] prefetch_first_addr;
    always@(posedge clk)begin
        if(rst)
            prefetch_first_addr <= 0;
        else if(request_addr_edge && !prefetch_area)
            prefetch_first_addr <= wbs_adr_i;
    end    

    //prefetch_ack
    reg prefetch_ack;
    always@(posedge clk)begin
        if (rst) begin
            prefetch_ack <= 0 ;
        end
        else if (prefetch_ack)begin
            prefetch_ack <= 0 ;
        end
        else if(ram_ack & !ram_we)begin
            if(prefetch_addr < prefetch_ack_cnt)
                prefetch_ack <= 1;
        end         
        else if(prefetch_area) begin
            if(prefetch_addr <= prefetch_ack_cnt)
                prefetch_ack <= 1;
        end
    end

    //take out prefetch_data
    reg[31:0] prefetch_data;
    wire [3:0]prefetch_addr;
    assign prefetch_addr = prefetch_area ? (wbs_adr_i - prefetch_first_addr)>>2 : 0;
    always@(posedge clk)begin
        if(prefetch_area)
            prefetch_data <= prefetch_data_reg[prefetch_addr];
    end

    //store prefetch_data
    reg [31:0] prefetch_data_reg[9:0];
    always@(posedge clk)begin
        if (ram_ack)begin            
            prefetch_data_reg[prefetch_ack_cnt] <= user_bram_o;
        end  
    end

    wire ram_stb;
    assign ram_stb = (request_user_bram) && ((request_addr_edge || prefetch) && !prefetch_area) ;
    wire request_addr_edge;
    assign request_addr_edge = ((request_user_bram) && (addr_r != wbs_adr_i))? 1 : 0;
    reg [31:0] addr_r;    
    always@(posedge clk)begin
        addr_r <= (request_user_bram) ? wbs_adr_i: 0;
    end

    //prefetch_cnt
    wire prefetch;
    assign prefetch = prefetch_w || prefetch_r;
    wire prefetch_w;
    assign prefetch_w = request_addr_edge & !ram_we;
    reg prefetch_r;
    reg [3:0] prefetch_cnt;
    always@(posedge clk)begin
        if (rst) begin
            prefetch_r <= 0;
            prefetch_cnt <= 0;
        end
        else if (prefetch & !prefetch_area)begin            
            prefetch_cnt <= (prefetch_cnt < N-1) ? prefetch_cnt + 1 : 0 ;
            prefetch_r <= (prefetch_cnt < N-1) ?  1 : 0 ;
        end        
    end

    //prefetch_ack_cnt 
    wire nomal_ack;
    assign nomal_ack =(!prefetch_area) && ram_ack;
    reg [3:0] prefetch_ack_cnt;
    always@(posedge clk)begin
        if (rst) begin
            prefetch_ack_cnt <= 0;
        end
        else if (ram_ack)begin            
            prefetch_ack_cnt <= (prefetch_ack_cnt < N) ? prefetch_ack_cnt + 1 : prefetch_ack_cnt ;
        end  
        else if(ram_stb)   prefetch_ack_cnt <= 0;
    end    

    exmem_pipeline #(
    .N(N)
)user_exmem_pipeline(
    .clk(clk),
    .rst(rst),		// active high (from WB)
    .stb(ram_stb),		// command strobe -request
    .we(ram_we),		// 1: write, 0: read
    .sel(ram_sel),		// byte-enable
    .dat_i(ram_data),	// data in
    .addr(ram_address),		// address in
	
    .ack(ram_ack),		// ready
    .dat_o(user_bram_o)	    	// data out
    );


endmodule

`default_nettype wire
