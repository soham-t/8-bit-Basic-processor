`timescale 1ns/1ps
module example1;
 // Inputs
 reg clk;
 reg [17:0] id;
  // Instantiate the Unit Under Test (UUT)
  instructdecoder uut (
   .clk(clk),
   .id(id)
   );
   initial begin
     clk=0;
   end
   always begin
     #0.05 clk=~clk;
   end
   //intialize the inputs
   initial begin
             id=18'b110010100011111000;//Move 8'b11111000 to Register R5
      #0.5     id=18'b110011010111001100;//Move 8'b11001100 to Register R6 
      #0.5     id=18'b001110111011001100;//Subtract R6 from R5     
      #0.5   id=18'b011010111011001100;//Decrement R5 data
      #0.5   id=18'b011010111011001100;//Decrement R5 data
      #0.5     id=18'b100010111011001100;//Halt
 end
 endmodule
