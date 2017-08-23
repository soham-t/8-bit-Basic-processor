`timescale 1ns/1ps
module example5;
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
               id=18'b110010100011001001;//Move 8'b11001001 to Register R5
      #0.5     id=18'b000111010111101100; // Move R5 to accumulator
      #0.5     id=18'b000000100010010011; // Rotate left accumulator data
      #0.5     id=18'b000000100010101101; // Rotate left accumulator data
      #0.5     id=18'b000000000010001011; // Rotate right accumulator data
      #0.5     id=18'b100010111011001100; //Halt
 end
 endmodule
