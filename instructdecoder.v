`timescale 1ns/1ps
module instructdecoder(id,clk);
input [17:0] id;
reg [3:0] bit1;
reg [2:0] bit2,bit3;
reg [7:0] bit4;
input clk;
always@*
begin
  $display("id is %b",id);
  bit1=id[17:14];
  bit2=id[13:11];
  bit3=id[10:8];
  bit4=id[7:0];
end
processor g1(bit1,bit2,bit3,bit4,clk);
endmodule
    
