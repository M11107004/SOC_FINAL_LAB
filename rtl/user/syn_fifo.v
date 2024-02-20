module syn_fifo #(parameter DEPTH=4, DATA_WIDTH=8) (
  input clk, rst_n,
  input w_en, r_en,
  input [DATA_WIDTH-1:0] data_in,
  output reg [DATA_WIDTH-1:0] data_out,
  output full, empty, irq_request,
  output [$clog2(DEPTH)-1:0] data_num
);
  
  reg [$clog2(DEPTH)-1:0] w_ptr, r_ptr;
  reg [DATA_WIDTH-1:0] fifo[(DEPTH)-1:0];
  
  // Set Default values on reset.
  always@(posedge clk) begin
    if(!rst_n) begin
      w_ptr <= 0; r_ptr <= 0;
      data_out <= 0;
    end
  end
  
  // To write data to FIFO
  always@(posedge clk) begin
    if(w_en & !full)begin
      fifo[w_ptr] <= data_in;
      w_ptr <= w_ptr + 1;
    end
  end
  
  // To read data from FIFO
  always@(posedge clk) begin
    if(r_en & !empty) begin
      data_out <= fifo[r_ptr];
      r_ptr <= r_ptr + 1;
    end
  end
  
  assign full = ((w_ptr+1'b1) == r_ptr);
  assign empty = (w_ptr == r_ptr);
  //assign irq_request = ((r_ptr + (DEPTH >>1)) == w_ptr) || ((w_ptr + (DEPTH >>1)) == r_ptr) ;
  assign irq_request = (r_ptr[$clog2(DEPTH)-1] == ~w_ptr[$clog2(DEPTH)-1]) && (r_ptr[$clog2(DEPTH)-2:0] == w_ptr[$clog2(DEPTH)-2:0]) ;
  assign data_num = (w_ptr > r_ptr) ? w_ptr - r_ptr :
                    (w_ptr < r_ptr) ? r_ptr - w_ptr : 0 ;
endmodule
