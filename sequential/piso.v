module piso(clk,rst,pin,load,sout);
input clk,rst,load;
input [3:0]pin;
output reg sout;
reg [3:0]shift;
always @ (posedge clk or posedge rst)
begin
if(rst)
begin
shift<=4'b0;
end
else if(load)
begin
shift<=pin;
end
else begin
shift<={1'b0,shift[3:1]};
end
end
assign sout=shift[0];
endmodule
module piso2_tb;
reg clk,rst,load;
reg [3:0]pin;
wire sout;
piso P(clk,rst,pin,load,sout);
initial
begin
rst=1;clk=0;pin=4'b0;load=0;
#10;
rst=0;#10;
load=1;pin=4'b1010;
#10;
load=0;#10;
#40;
$stop;
end
always #5 clk=~clk;
endmodule
