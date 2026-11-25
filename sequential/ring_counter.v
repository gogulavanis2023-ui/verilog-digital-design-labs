module ring(rst,clk,q);
input rst,clk;
output reg [2:0]q;
always @(posedge clk or posedge rst)
begin
if(rst)
q=3'b001;
else
q={q[1:0],q[2]};
end
endmodule
module ring_tb;
reg rst,clk;
wire [2:0]q;
ring r(rst,clk,q);
initial
begin
rst=1; clk=0;#10;
rst=0; #50;
$stop;
end
always #5 clk=~clk;
endmodule