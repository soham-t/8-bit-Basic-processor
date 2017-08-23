`timescale 1ns/1ps
module ex(clk);
  input clk;
  wire [7:0] rdata1,rdata2;
  reg [2:0] wadd,radd;
  reg [7:0] wdata;
  reg op1,op2,ctr;
  initial begin
    wadd=5;
    radd=5;
    op1=0;
    op2=1;
    ctr=0;
    wdata=12;
  end
  regbank x1(rdata1,clk,wadd,radd,wdata,op1,ctr);
  regbank x2(rdata2,clk,wadd,radd,wdata,op2,ctr);
endmodule 
