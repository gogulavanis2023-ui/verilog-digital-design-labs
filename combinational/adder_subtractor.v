module fa(A,B,Cin,s,Cout);
input A,B,Cin;
output s,Cout;
assign s=A^B^Cin;
assign Cout=((A^B)&Cin)|(A&B);
endmodule
module rca(x,y, cin,sum,cout);
input [3:0]x,y;
input cin;
output [3:0]sum;
output cout;
wire c1,c2,c3;
fa F1(x[0],y[0],cin,sum[0],c1);
fa F2(x[1],y[1],c1,sum[1],c2);
fa F3(x[2],y[2],c2,sum[2],c3);
fa F4(x[3],y[3],c3,sum[3],cout);
endmodule
module add_sub(a,b,mode,res,cout);
input [3:0]a,b;
input mode;
output [3:0]res;
output cout;
wire [3:0]b_mod;
wire cin;
assign b_mod=b^{4{mode}};
assign cin=mode;
rca R(a,b_mod,cin,res,cout);
endmodule
module adder_sub_tb;
reg [3:0]a,b;
reg mode;
wire [3:0]res;
wire cout;
add_sub A(a,b,mode,res,cout);
initial
begin
a=4'b1010;b=4'b0000;mode=0;#20;
a=4'b1001;b=4'b0110;mode=1;#20;
$stop;
end
endmodule