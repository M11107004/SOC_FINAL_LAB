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

`default_nettype wire
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32,
    parameter DELAYS = 10,

    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
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

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

// Assuming LA probes [65:64] are for controlling the count clk & reset  
//assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
//assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;

// IO
//assign io_out = count;
//assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

// IRQ
//assign irq = 3'b000;	// Unused
// LA
//assign la_data_out = {{(127-BITS){1'b0}}, count};
// Assuming LA probes [63:32] are for controlling the count register  
//assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};

assign io_out	=	uart_io_out ;			
assign io_oeb	=	uart_io_oeb ;	
			
assign user_irq =	uart_irq ;

wire clk;
wire rst;    
assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;

// WB MI A
//assign wbs_ack_o = user_bram_ack_o | user_uart_ack_o ;

//assign wbs_dat_o = 	(user_bram_ack_o)  ? user_bram_o :
//			        (user_uart_ack_o ) ? user_uart_o : 0;

assign wbs_dat_o =  (request_user_uart ) ? user_uart_o :
                    (request_user_bram && !prefetch_area) ? user_bram_o:
                    (request_user_bram &&  prefetch_area) ? prefetch_data:
                    (data_y_request ) ? data_y:
                    (user_fir_request ) ? sm_tdata:0;
                    
assign wbs_ack_o =  (request_user_uart ) ? user_uart_ack_o :
                    (request_user_bram && !prefetch_area) ? nomal_ack :
                    (request_user_bram &&  prefetch_area) ? prefetch_ack:
                    (user_fir_request ) ? user_fir_ack_o : 0;

// request signal
wire request_user_uart;
assign request_user_uart = (wbs_stb_i & wbs_cyc_i &(wbs_adr_i[31:20] == 12'h300)) ? 1 : 0;
       
wire request_user_bram;
assign request_user_bram = request_fir_data || request_code || request_data;

wire request_code;
assign request_code = (wbs_stb_i & wbs_cyc_i &(wbs_adr_i[31:20] == 12'h380) & (!wbs_adr_i[11])) ? 1 : 0;

wire request_data;
assign request_data = (wbs_stb_i & wbs_cyc_i &(wbs_adr_i[31:20] == 12'h350) & (wbs_adr_i[11] & !wbs_adr_i[10])) ? 1 : 0;

wire request_fir_data;
assign request_fir_data = (wbs_stb_i & wbs_cyc_i &(wbs_adr_i[31:20] == 12'h350) & (wbs_adr_i[11] & wbs_adr_i[10])) ? 1 : 0;

wire user_fir_request;
assign user_fir_request = (wbs_stb_i & wbs_cyc_i & (wbs_adr_i[31:20] == 12'h360)) ? 1 : 0;

/////////////
//fir
/////////////
wire  axis_clk;
wire  axis_rst_n;
assign axis_clk = wb_clk_i;
assign axis_rst_n = !wb_rst_i;

wire                              awready;
wire                              wready;
wire                              awvalid;//i
wire        [(pADDR_WIDTH-1): 0]  awaddr;//i
wire                              wvalid;//i
wire signed [(pDATA_WIDTH-1): 0]  wdata;//i
wire                              arready;
wire                              rready;//i
wire                              arvalid;//i
wire        [(pADDR_WIDTH-1): 0]  araddr;//i
wire                              rvalid;
wire signed [(pDATA_WIDTH-1): 0]  rdata;
wire                              ss_tvalid;//i
wire signed [(pDATA_WIDTH-1): 0]  ss_tdata;//i
wire                              ss_tlast;//i
wire                              ss_tready;
wire                              sm_tready;//i
wire                              sm_tvalid;
wire signed [(pDATA_WIDTH-1): 0]  sm_tdata;
wire                              sm_tlast;


wire tap_in_request; 
assign tap_in_request = (user_fir_request && wbs_adr_i[19:0] >= 20'h40 && wbs_adr_i[19:0] <=20'h7f) ? 1: 0;
wire control_in_request;
assign control_in_request = (user_fir_request && wbs_adr_i[19:0] == 20'h00 ) ? 1: 0;
wire data_length_in_request;
assign data_length_in_request = (user_fir_request && wbs_adr_i[19:0] == 20'h10 ) ? 1: 0;
wire x_in_request;
assign x_in_request = (user_fir_request && wbs_adr_i[19:0] >=20'h80) ? 1: 0;
wire data_y_request;
assign data_y_request = (user_fir_request && wbs_adr_i[19:0] >=20'h84) ? 1: 0;

wire user_fir_ack_o ;
assign user_fir_ack_o = (awready && wready) ? 1 :
			(control_in_request && awready) ?1 :
			(data_length_in_request && awready) ?1 : 
			(data_y_request) ?1 : 
			(rvalid) ? 1 :
			(sm_tvalid) ? 1 : 0;

//take out data_y
reg [(pDATA_WIDTH-1):0]data_y;
always@(posedge wb_clk_i)begin
	if(wb_rst_i) begin
		data_y <= 0;			
	end
	else if(sm_tvalid) data_y <= sm_tdata;	
end

assign awvalid   = ((tap_in_request || control_in_request || data_length_in_request) & wbs_we_i) ? 1 : 0;
assign awaddr    = ((tap_in_request || control_in_request || data_length_in_request) & wbs_we_i) ? wbs_adr_i[(pADDR_WIDTH-1): 0] : 0;

assign wvalid    = ((tap_in_request || control_in_request || data_length_in_request)  & wbs_we_i)? 1 : 0;
assign wdata     = ((tap_in_request || control_in_request || data_length_in_request)  & wbs_we_i) ? wbs_dat_i : 0;

assign rready    = (tap_in_request & !wbs_we_i) ? 1 : 0;
assign arvalid   = (tap_in_request & !wbs_we_i) ? 1 : 0;
assign araddr    = (tap_in_request & !wbs_we_i) ? wbs_adr_i[(pADDR_WIDTH-1): 0] : 0;

assign ss_tlast = ss_tlast_sig || ss_tlast_sig_hold;
wire ss_tlast_sig;
assign ss_tlast_sig = (data_length_count==(data_length-1) && ss_tready) ? 1 : 0;
reg ss_tlast_sig_hold;
always@(posedge wb_clk_i)begin
	if(wb_rst_i) ss_tlast_sig_hold  <= 0;
	else if (sm_tlast) ss_tlast_sig_hold  <= 0;
	else if(ss_tlast_sig)ss_tlast_sig_hold  <= 1;
end


assign ss_tvalid = (x_in_request & wbs_we_i) ? 1 : 0;
assign ss_tdata  = (x_in_request & wbs_we_i) ? wbs_dat_i : 0;

reg [(pDATA_WIDTH-1):0]data_length,data_length_count;
always@(posedge wb_clk_i)begin
	if(wb_rst_i) begin
		data_length <= 0;
		data_length_count <=0;		
	end
	else if(data_length_in_request) data_length <= wbs_dat_i;
	else if (sm_tlast) data_length_count <= 0;
	else if(ss_tready) data_length_count <= data_length_count+1;
end



assign sm_tready = (user_fir_request) ? 1 : 0;


// ram for tap
wire        [3:0]        tap_WE;
wire                     tap_EN;
wire [(pDATA_WIDTH-1):0] tap_Di;
wire [(pADDR_WIDTH-1):0] tap_A;
wire [(pDATA_WIDTH-1):0] tap_Do;


// ram for data
wire          [3:0]      data_WE;
wire                     data_EN;
wire [(pDATA_WIDTH-1):0] data_Di;
wire [(pADDR_WIDTH-1):0] data_A;
wire [(pDATA_WIDTH-1):0] data_Do;

wire [1:0] state;
wire ap_start_sig,ss_write_valid,ctrl_tap_valid,ctrl_tap_ready;

fir user_fir(
        .awready(awready), //o
        .wready(wready), //o
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready), //o
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid), //o
        .rdata(rdata), //o
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready), //o
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid), //o
        .sm_tdata(sm_tdata), //o
        .sm_tlast(sm_tlast), //o

        // ram for tap
        .tap_WE(tap_WE), //o
        .tap_EN(tap_EN), //o
        .tap_Di(tap_Di), //o
        .tap_A(tap_A), //o
        .tap_Do(tap_Do),

        // ram for data
        .data_WE(data_WE), //o
        .data_EN(data_EN), //o
        .data_Di(data_Di), //o
        .data_A(data_A), //o
        .data_Do(data_Do),

        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n),
        .state(state),
        .ss_write_valid(ss_write_valid),
        .ap_start_sig(ap_start_sig),
        .ctrl_tap_valid(ctrl_tap_valid),
        .ctrl_tap_ready(ctrl_tap_ready)

    );

// RAM for tap
bram11 tap_RAM (
           .CLK(axis_clk),
           .WE(tap_WE),
           .EN(tap_EN),
           .Di(tap_Di),
           .A(tap_A),
           .Do(tap_Do)
       );

// RAM for data: choose bram11 or bram12
bram11 data_RAM(
           .CLK(axis_clk),
           .WE(data_WE),
           .EN(data_EN),
           .Di(data_Di),
           .A(data_A),
           .Do(data_Do)
       );

/////////////
//bram
/////////////
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
wire prefetch_area;
assign prefetch_area = (((wbs_adr_i > prefetch_first_addr) && (wbs_adr_i <= (prefetch_first_addr + 32'd36))) && !ram_we && request_user_bram)  ? 1 : 0;
reg[31:0] prefetch_first_addr;
always@(posedge clk)begin
    if(rst)
        prefetch_first_addr <= 0;
    else if(request_addr_edge && !prefetch_area && !ram_we)
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
        if(ram_ack && (prefetch_addr <= prefetch_ack_cnt))
            prefetch_ack <= 1;
        else prefetch_ack <= 1;
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
        prefetch_cnt <= (prefetch_cnt < DELAYS-1) ? prefetch_cnt + 1 : 0 ;
        prefetch_r <= (prefetch_cnt < DELAYS-1) ?  1 : 0 ;
    end        
end
//prefetch_ack_cnt 
wire nomal_ack;
assign nomal_ack =(request_user_bram) && ram_ack && ~ram_ack_d;
reg ram_ack_d;
always@(posedge clk)begin
    ram_ack_d <= ram_ack;
end
reg [3:0] prefetch_ack_cnt;
always@(posedge clk)begin
    if (rst) begin
        prefetch_ack_cnt <= 0;
    end
    else if (ram_ack && !ram_we)begin            
        prefetch_ack_cnt <= (prefetch_ack_cnt < DELAYS) ? prefetch_ack_cnt + 1 : prefetch_ack_cnt ;
    end  
    else if(ram_stb)   prefetch_ack_cnt <= 0;
end   

exmem_pipeline #(
    .N(DELAYS)
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


////////
//uart
////////

// inputs to uart
// Wishbone Slave ports (WB MI A)
wire [31:0] uart_address;
wire [31:0] uart_data;
wire uart_we,uart_stb, uart_cyc;
wire [3:0]uart_sel;
assign uart_stb = (request_user_uart)? wbs_stb_i:32'b0;
assign uart_cyc = (request_user_uart)? wbs_cyc_i:32'b0;
assign uart_we  = (request_user_uart)? wbs_we_i:0;
assign uart_sel = (request_user_uart)? wbs_sel_i:0;
assign uart_data = (request_user_uart)? wbs_dat_i:32'b0;
assign uart_address = (request_user_uart)? wbs_adr_i:32'b0;


wire user_uart_ack_o;
wire [31:0] user_uart_o;

// Logic Analyzer Signals
wire  [`MPRJ_IO_PADS-1:0] uart_io_in;
wire  [`MPRJ_IO_PADS-1:0] uart_io_out;
wire  [`MPRJ_IO_PADS-1:0] uart_io_oeb;
assign uart_io_in	= io_in;

// User maskable interrupt signals
wire[2:0] uart_irq;

uart uart (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave

    .wbs_stb_i(uart_stb),
    .wbs_cyc_i(uart_cyc),
    .wbs_we_i(uart_we),
    .wbs_sel_i(uart_sel),
    .wbs_dat_i(uart_data),
    .wbs_adr_i(uart_address),
    .wbs_ack_o(user_uart_ack_o),
    .wbs_dat_o(user_uart_o),

    // IO ports
    .io_in  (uart_io_in      ),
    .io_out (uart_io_out     ),
    .io_oeb (uart_io_oeb     ),

    // irq
    .user_irq (uart_irq)
);



////////
//fir
////////

endmodule	// user_project_wrapper

`default_nettype wire
