`timescale 1ns/1ps
module multiply(ctr1,out,A,B,clk,ctr);
input [7:0] A;
output reg ctr1;
input clk;
input [3:0] ctr;
    input [7:0] B;
    output reg [15:0] out;
     reg [15:0] Q;
integer i,j,count;
parameter r=10;
reg prod[7:0][7:0];
wire [55:0] s,c;
reg [7:0] A1,B1;
wire [15:0] Q1;

always @(A, B) begin
//
//  if (A[7] == 1) A1 = A + 1;
//  else A1 = A;
//  if (B[7] == 1) B1 = B + 1;
//  else B1 = B;
  
  for(i=0;i<8;i=i+1) begin
    for(j=0;j<8;j=j+1) begin
      prod[i][j] <= (A[i] && B[j]);
    end
  end
end

always @(Q1) begin
  if (Q1[14] == 1)
    Q = Q1;
  else 
    Q = Q1;
end
always @(posedge clk)
begin
if(ctr==4'b0100)
  begin
    out=Q1;
    ctr1=1;
  end
    repeat(r)
  begin
    @(posedge clk) count=count+1;
  end
  ctr1=0;
end  

HA H1 (prod[1][0],prod[0][1],s[0],c[0]);

fa F1 (prod[1][1],prod[0][2],c[0],s[1],c[1]);
HA H2 (prod[2][0],s[1],s[2],c[2]);

fa F2 (prod[0][3],c[1],c[2],s[3],c[3]);
fa F3 (prod[2][1],prod[1][2],s[3],s[4],c[4]);
HA H3 (prod[3][0],s[4],s[5],c[5]);

fa F4 (c[5],c[4],c[3],s[6],c[6]);
fa F5 (prod[1][3],prod[0][4],s[6],s[7],c[7]);
fa F6 (prod[3][1],prod[2][2],s[7],s[8],c[8]);
HA H4 (prod[4][0],s[8],s[9],c[9]);

fa F7 (c[6],c[7],c[8],s[10],c[10]);
fa F8 (c[9],s[10],prod[0][5],s[11],c[11]);
fa F9 (s[11],prod[1][4],prod[2][3],s[12],c[12]);
fa F10 (s[12],prod[3][2],prod[4][1],s[13],c[13]);
HA H5 (s[13],prod[5][0],s[14],c[14]);

fa F11 (c[14],c[13],c[12],s[15],c[15]);
fa F12 (c[10],c[11],s[15],s[16],c[16]);
fa F13 (s[16],prod[0][6],prod[1][5],s[17],c[17]);
fa F14 (s[17],prod[2][4],prod[3][3],s[18],c[18]);
fa F15 (s[18],prod[4][2],prod[5][1],s[19],c[19]);
HA H6 (s[19],prod[6][0],s[20],c[20]);

fa F16 (c[15],c[16],c[17],s[21],c[21]);
fa F17 (s[21],c[19],c[18],s[22],c[22]);
fa F18 (s[22],prod[1][6],c[20],s[23],c[23]);
fa F19 (s[23],prod[2][5],prod[3][4],s[24],c[24]);
fa F20 (s[24],prod[4][3],prod[5][2],s[25],c[25]);
fa F36 (s[25],prod[7][0],prod[0][7],s[55],c[55]);
HA H7 (s[55],prod[6][1],s[26],c[26]);

fa F21 (c[21],c[22],c[23],s[27],c[27]);
fa F22 (s[27],c[24],c[25],s[28],c[28]);
fa F23 (s[28],c[26],c[55],s[29],c[29]);
fa F24 (s[29],prod[3][5],prod[4][4],s[30],c[30]);
fa F37 (s[30],prod[7][1],prod[1][7],s[42],c[42]);
fa F25 (s[42],prod[5][3],prod[6][2],s[43],c[43]);
HA H8 (s[43],prod[2][6],s[31],c[31]);

fa F26 (c[27],c[28],c[29],s[32],c[32]);
fa F27 (s[32],c[30],c[42],s[33],c[33]);
fa F38 (s[33],c[43],c[31],s[44],c[44]);
fa F28 (s[44],prod[3][6],prod[4][5],s[34],c[34]);
fa F29 (s[34],prod[5][4],prod[6][3],s[45],c[45]);
fa F39 (s[45],prod[7][2],prod[2][7],s[35],c[35]);

fa F30 (c[32],c[33],c[44],s[36],c[36]);
fa F31 (s[36],c[34],c[45],s[37],c[37]);
fa F40 (s[37],c[35],prod[4][6],s[46],c[46]);
fa F32 (s[46],prod[5][5],prod[6][4],s[47],c[47]);
fa F41 (s[47],prod[7][3],prod[3][7],s[38],c[38]);

fa F33 (c[36],c[37],c[46],s[39],c[39]);
fa F42 (s[39],c[47],c[38],s[48],c[48]);
fa F34 (s[48],prod[5][6],prod[6][5],s[49],c[49]);
fa F43 (s[49],prod[7][4],prod[4][7],s[40],c[40]);

fa F35 (c[39],c[48],c[49],s[50],c[50]);
fa F44 (s[50],c[40],prod[6][6],s[51],c[51]);
fa F45 (s[51],prod[7][5],prod[5][7],s[41],c[41]);

fa F46 (c[50],c[51],c[41],s[52],c[52]);
fa F47 (s[52],prod[7][6],prod[6][7],s[53],c[53]);

fa F48 (c[52],c[53],prod[7][7],s[54],c[54]);

assign Q1[15] = c[54];
assign Q1[14] = s[54];
assign Q1[13] = s[53];
assign Q1[12]= s[41];
assign Q1[11]= s[40];
assign Q1[10]= s[38];
assign Q1[9]= s[35];
assign Q1[8]= s[31];
assign Q1[7]= s[26];
assign Q1[6]= s[20];
assign Q1[5]= s[14];
assign Q1[4]= s[9];
assign Q1[3]= s[5];
assign Q1[2]= s[2];
assign Q1[1]= s[0];
assign Q1[0] = prod[0][0];

endmodule


