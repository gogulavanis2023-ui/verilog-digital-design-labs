module FOUR_BIT_Adder_SL(a,b,cin,sum);

input [3:0]a,b;input cin;

output wire [4:0]sum;

wire cout1,cout2,cout3;

FullAdder FA1(a[0],b[0],cin,sum[0],cout1);

FullAdder FA2(a[1],b[1],cout1,sum[1],cout2);

FullAdder FA3(a[2],b[2],cout2,sum[2],cout3);



FullAdder FA4(a[3],b[3],cout3,sum[3],sum[4]);

endmodule
