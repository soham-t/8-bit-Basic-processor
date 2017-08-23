`timescale 1ns/1ps
module example4;
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
      #0.5     id=18'b000111010111101100; //Move data from R5 to accumulator
      #0.5     id=18'b110010000010010011; //Move 8'b10010011 to Register R4
      #0.5     id=18'b110110100010101101; //bitwise OR R5 data with accumulator
      #0.5     id=18'b111110100010001011;//bitwise XOR R5 data with accumulator
      #0.5     id=18'b111010100001101001;//bitwise AND R5 data with accumulator
      #0.5     id=18'b100010111011001100; //Halt
 end
 endmodule
