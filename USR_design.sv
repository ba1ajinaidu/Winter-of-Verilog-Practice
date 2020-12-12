//BalajiNaidu

// Code your design here
module universal_shift_register(clr, left_in, right_in, s0s1, clk,parl_in, out);
  //inputs
  input clr,clk,left_in,right_in;
  input [1:0] s0s1;
  input [3:0] parl_in;

  //output

  output out;
  reg [3:0] out;

  always@(posedge clk)
    begin
      if(clr)
        out = 4'b0000;//check clr
      else
        begin
          //perform the function based on the select line input
          case(s0s1)
            2'b00: out = out;//Do nothing
            2'b01: out = {out[2:0], left_in};// left shift
            2'b10: out = {right_in, out[3:1]};// right shit
            2'b11: out = parl_in;// parallel load
            
          endcase
        end
    end
endmodule
        
  