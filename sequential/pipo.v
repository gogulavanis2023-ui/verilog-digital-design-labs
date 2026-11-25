module pipo(rst,clk,load,pin,pout);
input rst,clk,load;
input [3:0]pin;
output reg [3:0]pout;
always @(posedge clk or posedge rst)
begin
if(rst) begin
pout<=4'b0;
end
else if(load) begin
pout<=pin;
end
end
endmodule
module pipo_tb;
reg rst,clk,load;
reg [3:0]pin;
wire [3:0]pout;
pipo p1(rst,clk,load,pin,pout);
initial
begin
rst=1;clk=0;pin=4'b0;load=0;#10;
rst=0;#10;
load=1;pin=4'b1110;#10;
load=0;#10;
#20;
end
always #5 clk=~clk;
endmodule