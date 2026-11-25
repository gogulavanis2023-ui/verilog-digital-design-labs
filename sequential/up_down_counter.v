module updown(rst,clk,ud,count);
input rst,clk,ud;
output reg [2:0]count;
always @(posedge clk or posedge rst)
begin
if(rst) begin
count=3'b000;
end
else if(ud) begin
count<=count+1;
end
else begin
count<=count-1;
end
end
endmodule
module updowntb;
reg rst,clk,ud;
wire [2:0]count;
updown u(rst,clk,ud,count);
initial
begin
rst=1;clk=0;ud=1;#10;
rst=0;#50;
ud=0;#50;
$stop;
end
always #5 clk=~clk;
endmodule
