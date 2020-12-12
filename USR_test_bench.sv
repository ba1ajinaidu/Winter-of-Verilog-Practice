//Balajinaidu

// Code your testbench here
// or browse Examples
module Universal_shift_register_tb;
  reg clr, clk, left_in, right_in;
  reg [3:0] parl_in;
  reg [1:0] s0s1;
  
  wire [3:0] out;
  //instance of design module
  universal_shift_register ins (clr, left_in, right_in, s0s1, clk,parl_in, out);
  
  initial
    begin
      clr = 0;
      clk = 0;
      left_in = 0;
      right_in = 0;
      parl_in = 0;
      s0s1 = 0;
      
      #10;
      clr = 1'b1;
      #10;
      
      clr = 1'b0;
      #20;
      
      //check for right shift
      right_in = 1'b1;
      s0s1 = 2'b01;
      #20;
      $monitor("right input = %p,mode= %p output= %p", right_in, s0s1, out);
      

      //check for left shift
      left_in = 1'b0;
      s0s1 = 2'b10;
      #20;
      $monitor("left input = %p,mode= %p output= %p", left_in, s0s1, out);
      

      //check for parallel load
      parl_in = 4'b1010;
      s0s1 = 2'b11;
      #20;
      $monitor("parallel input = %p,mode= %p output= %p", parl_in, s0s1, out);
  
    end
  
  always #5 clk = ~clk;
  
endmodule
  
      