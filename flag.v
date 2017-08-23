`timescale 1ns/1ps
module flag(f,cout,acc,clk);
  /* f[0] =carry,f[1] = zero,f[2]=signbit*/
  input clk;
  input cout;
  input [7:0] acc;
  output reg [2:0] f;
  always@(posedge clk)
  begin
  if(cout==1)
    begin
    f[0]=1;
  end
else
  begin
  f[0]=0;
end
  if(acc[7]==1) begin
    f[2]=1;
  end
else begin
  f[2]=0;
end
if(acc==0) begin
 f[1]=1;
end
else begin
  f[1]=0;
end
end
endmodule 
    
    
