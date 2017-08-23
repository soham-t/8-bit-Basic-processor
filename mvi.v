`timescale 1ns/1ps
module mvi(ctr,data2,add,data,clk,ctr1);
  /* in this module the data from ouside or memory is taken and transferring it to the required register*/
input clk;
input [2:0] add;
input [3:0] ctr1;
input [7:0] data;
output reg [7:0] data2;
output reg ctr;
parameter r=3;
integer count;
always @(posedge clk)
begin
  if(ctr1==4'b1100)
    begin
      data2=data;
      ctr=1;
    end
    repeat(r)
begin
  @(posedge clk) count=count+1;
end
ctr=0;
  end
endmodule




