module siso(clk,rst,sin,sout);
input clk,rst,sin;
output reg sout;
reg [3:0]shift;
always @(posedge clk or posedge rst)
begin
if(rst) begin
shift<=4'b0;
end
else begin
shift<={sin,shift[3:1]};
end
end
assign sout=shift[0];
endmodule

module siso_tb;
reg clk,rst,sin;
wire sout;
siso S(clk,rst,sin,sout);
initial
begin
rst=1;
clk=0; sin=0;#10;
rst=0; #10;
sin=1;#10;
sin=0;#10;
sin=0;#10;
sin=1;#10;
#40;
$stop;
end
always #5 clk=~clk;
endmodule
