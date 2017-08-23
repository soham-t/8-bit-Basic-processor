`timescale 1ns/1ps
module rotate(ctr,out,clk,in,cntrl,ctr2);
  /* right rotate radd=000, left rotatae radd=001*/
  input clk;
  output reg ctr;
  output reg [7:0] out;
  input [7:0] in;
  input [2:0] cntrl;
  input [3:0] ctr2;
  reg f;
  parameter r=3;
  integer count;
  reg [7:0] temp;
  
always @(posedge clk)
begin
  temp=in;
if(ctr2==4'b0000)
  begin
if(cntrl==3'b000)//0 for left rotate, 1 for right rotate 
  begin
  f=temp[7];
  temp=temp<<1;
  temp[0]=f;
  ctr=1;
  end
  if(cntrl==3'b001)
  begin
  f=temp[0];
  temp=temp>>1;
  temp[7]=f;
  ctr=1;
  end  
out=temp;
repeat(r)
begin
  @(posedge clk) count=count+1;
end
ctr=0;
end
end
endmodule
