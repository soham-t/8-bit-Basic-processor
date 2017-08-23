`timescale 1ns/1ps
module HA(a,b,sum,carry);
 output sum,carry;
 input a,b;
 xor(sum,a,b);
 and(carry,a,b);

endmodule