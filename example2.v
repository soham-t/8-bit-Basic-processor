`timescale 1ns/1ps
module example2;
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
               id=18'b110010100011011000;//Move 8'b11011000 to Register R5
      #0.5     id=18'b110011010111101100; //Move 8'b11101100 to Register R6
      #1     id=18'b010010111011001100;     //Multiply contents of R5 and R6 and store them in R6(First 8 bit) and R7(Last 8 bit)
      #1     id=18'b100010111011001100;//Halt
 end
 endmodule
