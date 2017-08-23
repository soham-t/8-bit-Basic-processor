`timescale 1ns/1ps
module mve(ctr2,rdata1,rdata2,radd1,radd2,clk,ctr1);
  /* in this module the data will be moved from reg1 to reg2*/

input clk;
input [2:0] radd2,radd1;
input [3:0] ctr1;
input [7:0] rdata2;
output reg [7:0] rdata1;
output reg ctr2;
parameter r=3;
integer count;
always @(posedge clk)
begin
if(ctr1==4'b1011)
  begin
rdata1=rdata2;
ctr2=0;
end
repeat(r)
begin
  @(posedge clk) count=count+1;
end
ctr2=0;
end
endmodule


