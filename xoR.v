`timescale 1ns/1ps
module xoR(ctr,out,data2,data1,clk,ctr1);/* in this module logical XOR operation 
is performed between immediate data and accumulator data*/
input clk;
  input [3:0] ctr1;
  input [7:0] data1,data2;  
  output reg [7:0] out;
  output reg ctr;
  parameter r=3;
  integer count;
always@(posedge clk)
begin
if(ctr1==4'b1111)
begin
out=data1^data2;
ctr=1;
end
repeat(r)
begin
  @(posedge clk) count=count+1;
end
ctr=0;
end
endmodule
  

