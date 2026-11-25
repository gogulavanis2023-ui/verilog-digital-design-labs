module clock_divider(
    input clk,
    input rst,
    output reg out
);
parameter div = 28'd25000000;
reg [27:0] count;
always @(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        count <= 28'b0;
        out <= 1'b0;
    end
    else if(count == div - 28'd1)
    begin
        count <= 28'b0;
        out <= ~out;
    end
    else
    begin
        count <= count + 28'd1;
    end
end
endmodule
