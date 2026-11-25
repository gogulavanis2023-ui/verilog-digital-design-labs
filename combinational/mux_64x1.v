// 64x1 Multiplexer using hierarchical multiplexers
module MUX_64X1SL(
    input [63:0] D,
    input [5:0] s,
    output out
);
    wire [1:0] INTER;

    // Two 32x1 multiplexers
    MUX_32X1SL M81 (D[31:0], s[4:0], INTER[0]);
    MUX_32X1SL M82 (D[63:32], s[4:0], INTER[1]);

    // One 2x1 multiplexer to select between the two 32x1 multiplexers
    MUX_2X1 M3 (INTER[0], INTER[1], s[5], out);
endmodule

// 32x1 Multiplexer using hierarchical multiplexers
module MUX_32X1SL(
    input [31:0] D,
    input [4:0] s,
    output out
);
    wire [1:0] INTER;

    // Two 16x1 multiplexers
    MUX_16X1SL M81 (D[15:0], s[3:0], INTER[0]);
    MUX_16X1SL M82 (D[31:16], s[3:0], INTER[1]);

    // One 2x1 multiplexer to select between the two 16x1 multiplexers
    MUX_2X1 M3 (INTER[0], INTER[1], s[4], out);
endmodule

// 16x1 Multiplexer using hierarchical multiplexers
module MUX_16X1SL(
    input [15:0] D,
    input [3:0] s,
    output out
);
    wire [1:0] INTER;

    // Two 8x1 multiplexers
    MUX_8X1SL M81 (D[7:0], s[2:0], INTER[0]);
    MUX_8X1SL M82 (D[15:8], s[2:0], INTER[1]);

    // One 2x1 multiplexer to select between the two 8x1 multiplexers
    MUX_2X1 M3 (INTER[0], INTER[1], s[3], out);
endmodule

// 8x1 Multiplexer using hierarchical multiplexers
module MUX_8X1SL(
    input [7:0] D,
    input [2:0] s,
    output out
);
    wire [1:0] INTER;

    // Two 4x1 multiplexers
    MUX_4X1 M1 (D[0], D[1], D[2], D[3], s[0], s[1], INTER[0]);
    MUX_4X1 M2 (D[4], D[5], D[6], D[7], s[0], s[1], INTER[1]);

    // One 2x1 multiplexer to select between the two 4x1 multiplexers
    MUX_2X1 M3 (INTER[0], INTER[1], s[2], out);
endmodule

// 4x1 Multiplexer using 2x1 multiplexers
module MUX_4X1(
    input i0, i1, i2, i3,
    input s0, s1,
    output Y
);
    wire Y1, Y2;

    // Two 2x1 multiplexers for first stage
    MUX_2X1 M1 (i0, i1, s0, Y1);
    MUX_2X1 M2 (i2, i3, s0, Y2);

    // One 2x1 multiplexer for second stage
    MUX_2X1 M3 (Y1, Y2, s1, Y);
endmodule

// 2x1 Multiplexer
module MUX_2X1(
    input I0, I1, S,
    output Y
);
    wire sbar, w1, w2;

    // Logic for 2x1 multiplexer
    not G1 (sbar, S);
    and G2 (w1, I0, sbar);
    and G3 (w2, I1, S);
    or  G4 (Y, w1, w2);
endmodule


