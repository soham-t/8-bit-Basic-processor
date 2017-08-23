`timescale 1ns/1ps
module add_sub(ctr2,sum1,cout1,a,b,clk,ctrl);  
    output reg [7:0] sum1;
    output reg ctr2;
    wire [7:0] sum;
    output reg cout1;
    wire cout;
    input clk;
    input [7:0] a,b;
    input [3:0] ctrl;
    reg ctr;
    parameter r=3;
    integer count;
    always @(posedge clk) begin
    assign ctr =  ctrl==3 ? 1:
                  ctrl==6 ? 1:
                  ctrl==9 ? 1:
                 ((ctrl==0010)||(ctrl==0111)||(ctrl==0101)) ? 0:0;  
  end  
 wire c1,c2,c3,c4,c5,c6,c7;
 wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8;
 xor x1(temp1,b[0],ctr);
 xor x2(temp2,b[1],ctr);
 xor x3(temp3,b[2],ctr);
 xor x4(temp4,b[3],ctr);
 xor x5(temp5,b[4],ctr);
 xor x6(temp6,b[5],ctr);
 xor x7(temp7,b[6],ctr);
 xor x8(temp8,b[7],ctr);
  
 fa   FA1(a[0],temp1,ctr,sum[0],c1);
 fa   FA2(a[1],temp2,c1,sum[1],c2);
 fa   FA3(a[2],temp3,c2,sum[2],c3);
 fa   FA4(a[3],temp4,c3,sum[3],c4);
 fa   FA5(a[4],temp5,c4,sum[4],c5);
 fa   FA6(a[5],temp6,c5,sum[5],c6);
 fa   FA7(a[6],temp7,c6,sum[6],c7);
 fa   FA8(a[7],temp8,c7,sum[7],cout);
always @(posedge clk)
begin
  if((ctrl==4'b0010)||(ctrl==4'b0011)||(ctrl==4'b0110)||(ctrl==4'b0101)||(ctrl==4'b0111)||(ctrl==4'b1001))
    begin
  sum1=sum;
  cout1=cout;
  ctr2=1;
end
repeat(r)
begin
  @(posedge clk) count=count+1;
end
ctr2=0;
end  
endmodule


