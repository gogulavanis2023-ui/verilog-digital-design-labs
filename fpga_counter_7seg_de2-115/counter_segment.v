module counter_segment(
    input clk_in,
    input rst_n,
    output [6:0] hex1,
    output [6:0] hex2
);
wire clk;
wire [3:0] count;
wire [13:0] seg;
clock_divider cd(
    .clk(clk_in),
    .rst(rst_n),
    .out(clk)
);
counter_4bit cnt(
    .clk(clk),
    .rst(~rst_n),
    .count(count)
);
binary_to_segment bcd(
    .bin(count),
    .seg(seg)
);
assign hex1 = seg[13:7];
assign hex2 = seg[6:0];
endmodule