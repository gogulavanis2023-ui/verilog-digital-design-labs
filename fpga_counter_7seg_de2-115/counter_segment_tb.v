module counter_segment_tb;

reg clk_in;
reg rst_n;
wire [6:0] hex1;
wire [6:0] hex2;

counter_segment uut(
    .clk_in(clk_in),
    .rst_n(rst_n),
    .hex1(hex1),
    .hex2(hex2)
);

always #5 clk_in = ~clk_in;

initial begin
    clk_in = 0;
    rst_n = 0;
    #20 rst_n = 1;
    #2000 $stop;
end

endmodule
