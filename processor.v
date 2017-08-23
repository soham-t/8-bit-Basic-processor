`timescale 1ns/1ps
module processor (bit1,bit2,bit3,bit4,clk);
input clk;
input [3:0] bit1;
input [2:0] bit2,bit3;
input [7:0] bit4;
wire [7:0] r1,r2,rdata1,rdata3,acc,out1,out2,out3,out4;
wire [15:0] out5;
reg [2:0] wadd,radd1,radd2,ctrx;
reg [7:0] wdata,rdata2,data,data1,data2;
reg [3:0] ctry;
reg we;
wire ctr1,ctr2,ctr3,ctr4,ctr5,ctr6,ctr7,ctr8,cout;
wire [2:0] f;
wire [7:0] sum;
integer count;
reg [7:0] a,b,a1,b1;
initial begin
  data=10;
end
Regfile x0(r1,r2,radd1,radd2,wadd,wdata,clk,we);      
//regbank x1(r1,radd,wadd,wdata,clk,we);
mvi  x2(ctr1,rdata3,bit2,bit4,clk,bit1);
mve  x3(ctr2,rdata1,rdata2,bit2,bit3,clk,bit1);
acc  x4(acc,data,clk);
oR   x5(ctr3,out1,acc,bit4,clk,bit1);
xoR  x6(ctr4,out2,acc,bit4,clk,bit1);
anD  x7(ctr5,out3,acc,bit4,clk,bit1);
flag x8(f,cout,acc,clk);
rotate x9(ctr6,out4,clk,acc,bit2,bit1);
add_sub x10(ctr7,sum,cout,a,b,clk,bit1); 
multiply x11(ctr8,out5,a1,b1,clk,bit1);
//decoder
always @(posedge clk)
begin
  //INR
  if(bit1==4'b0101)
    begin
      //bit1=4'b0010;
      radd1=bit2;
  a=r1;
  b=8'b00000001;
  if(ctr7==1)
    begin
  wadd=bit2;
  wdata=sum;
  we=1;
end 
end
//DCR
if(bit1==4'b0110)
  begin
    //bit1=4'b0011;
   radd1=bit2;
  a=r1;
  b=8'b00000001;
  if(ctr7==1)
    begin
  wadd=bit2;
  wdata=sum;
  we=1;
end 
end
  //Multiply
  if(bit1==4'b0100)
  begin
  radd1=bit2;
  a1=r1;
  //@posedge(clk)
  radd2=bit3;
  b1=r2;
  if(ctr8==1)
    begin
   wadd=3'b110;
   wdata=out5[15-:8];
   we=1;
   @(posedge clk)
   wadd=3'b111;
   wdata=out5[7-:8];
   we=1;
end
end
//add-sub
if(bit1==4'b0010)
  begin
  radd1=bit2;
  a=r1;
  radd2=bit3;
  b=r2;
  if(ctr7==1)
    begin
  data=sum;
end
end
if(bit1==4'b0011)
  begin
  radd1=bit2;
  a=r1;
  radd2=bit3;
  b=r2;
  if(ctr7==1)
    begin
  data=sum;
end
end
//mvi
if((bit1==4'b1100)&&(ctr1==1))
  begin
  wdata=rdata3;
  wadd=bit2;
  radd1=bit2;
  we=1;
end
else
  //register
if(bit1==4'b1010)
  begin
    radd1=bit2;
    end
 else
   //mve registers
if((bit1==4'b1011)&&(ctr2==0))
  begin
    radd1=bit3;
    rdata2=r1;
    we=1;
    wdata=rdata1;
    wadd=bit2;  
    end
  else
    //or
    if((bit1==4'b1101)&&(ctr3==1))
      begin
        data=out1;
      end
    else
      //xor
   if((bit1==4'b1111)&&(ctr4==1))
            begin
              data=out2;
            end
else
  //and
 if((bit1==4'b1110)&&(ctr5==1))
            begin
              data=out3;
            end 
  else
    //rotate
    if((bit1==4'b0000)&&(ctr6==1))
    begin
    data=out4;
  end 
// mve acc
if(bit1==4'b0001)
  begin
    radd1=bit3;
    data=r1;
     end
//HLT
if(bit1==4'b1000)
  begin
 count=0;
 count=count+1;
  end
  //ADI
  if(bit1==4'b0111)
    begin
    radd1=bit2;
  a=r1;
  b=bit4;
  if(ctr7==1)
    begin
  data=sum;
end
end
//SBI
if(bit1==4'b1001)
    begin
    radd1=bit2;
  a=r1;
  b=bit4;
  if(ctr7==1)
    begin
  data=sum;
end
  end
  end
endmodule

