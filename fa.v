`timescale 1ns/1ps
module fa(a,b,cin,sum,carry);
  
    output  sum;
    output carry;
    input a,b;
    input cin;
    
    xor u1(sum,a,b,cin);
    and u2(n1,a,b);
    and u3(n2,b,cin);
    and u4(n3,a,cin);
    or u5(carry,n1,n2,n3);
    
endmodule



