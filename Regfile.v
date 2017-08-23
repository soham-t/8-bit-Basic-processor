`timescale 1ns / 1ps
module Regfile(rd1,rd2,a1,a2,a3,wd1,clock,we
    );
output reg [7:0] rd1,rd2;
input [2:0] a1,a2,a3;
input [7:0] wd1;
input clock,we;
reg [7:0] register [0:7];
integer i1,i2,i3;
always @(posedge clock)
begin
if(we)
begin
case(a3)
0:begin
register[0]<=wd1;
end
1:begin
register[1]<=wd1;
end
2:begin
register[2]<=wd1;
end
3:begin
register[3]<=wd1;
end
4:begin
register[4]<=wd1;
end
5:begin
register[5]<=wd1;
end
6:begin
register[6]<=wd1;
end
7:begin
register[7]<=wd1;
end
endcase
end
assign rd1 = a1 == 0 ? register[0] :
       a1 == 1 ? register[1] :
		 a1 == 2 ? register[2] :
		 a1 == 3 ? register[3] :
		 a1 == 4 ? register[4] :
		 a1 == 5 ? register[5] :
		 a1 == 6 ? register[6] :
		 a1 == 7 ? register[7] : 0;
assign rd2 = a2 == 0 ? register[0] :
       a2 == 1 ? register[1] :
		 a2 == 2 ? register[2] :
		 a2 == 3 ? register[3] :
		 a2 == 4 ? register[4] :
		 a2 == 5 ? register[5] :
		 a2 == 6 ? register[6] :
		 a2 == 7 ? register[7] :0;
end
endmodule

