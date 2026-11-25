module sipo(rst,clk,sin,pout);
input rst,clk,sin;
output reg [3:0]pout;
always @(posedge clk or posedge rst)
begin
if(rst) begin
pout<=4'b0;
end
else begin
pout<={sin,pout[3:1]};
end
end
endmodule
module sipo_tb;
reg rst,clk,sin;
wire [3:0]pout;
sipo s1(rst,clk,sin,pout);
initial
begin
rst=1;clk=0;sin=0;
#10;
rst=0; #10;
sin=1;#10;
sin=1;#10;
sin=1;#10;
sin=1;#10;
$stop;
end
always #5 clk=~clk;
endmodule