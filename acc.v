`timescale 1ns/1ps
module acc(a,data,clk);// a is the accumulator ouput and data is the input to the accumulator
  input [7:0] data;
  input clk;
  output reg [7:0] a;
  reg [7:0] r;
  always@(posedge clk)
  begin
    r=data;
    a=r;
  end
endmodule
