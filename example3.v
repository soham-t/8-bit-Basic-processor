`timescale 1ns/1ps
module example3;
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
               id=18'b110010000011011000;//Move 8'b11011000 to Register R4
      #0.5     id=18'b101101110011101100;//Move data from R4 to R3
      #0.5     id=18'b000110001111001100;//Move data to accumulator from R3     
      #0.5     id=18'b100010111011001100; //Halt
   
 end
 endmodule
