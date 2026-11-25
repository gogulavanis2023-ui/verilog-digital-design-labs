module demux(d0,d1,d2,d3,s0,s1,d);
input s0,s1,d;
output reg d0,d1,d2,d3;
always @(*)
begin
d0=(~s0&~s1)&d;
d1=~s0&s1&d;
d2=s0&~s1&d;
d3=s0&s1&d;
end
endmodule
module demux_tb;
reg s0,s1,d;
wire d0,d1,d2,d3;
demux D1(d0,d1,d2,d3,s0,s1,d);

initial begin
d=1;s0=0;s1=0;#20;
d=1;s0=0;s1=1;#20;
d=1;s0=1;s1=0;#20;
d=1;s0=1;s1=1;#20;
$stop;
end
endmodule
