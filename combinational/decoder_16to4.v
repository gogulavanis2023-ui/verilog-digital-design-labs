module decoder_16to4 (
    input [15:0] in,
    output reg [3:0] out,
    output reg valid
);

    always @(*) begin
        valid = 1'b0; // Set valid flag to 0 by default
        out = 4'b0000; // Default value for out
        
        case (in)
            16'b0000_0000_0000_0001: begin out = 4'b0000; valid = 1'b1; end
            16'b0000_0000_0000_0010: begin out = 4'b0001; valid = 1'b1; end
            16'b0000_0000_0000_0100: begin out = 4'b0010; valid = 1'b1; end
            16'b0000_0000_0000_1000: begin out = 4'b0011; valid = 1'b1; end
            16'b0000_0000_0001_0000: begin out = 4'b0100; valid = 1'b1; end
            16'b0000_0000_0010_0000: begin out = 4'b0101; valid = 1'b1; end
            16'b0000_0000_0100_0000: begin out = 4'b0110; valid = 1'b1; end
            16'b0000_0000_1000_0000: begin out = 4'b0111; valid = 1'b1; end
            16'b0000_0001_0000_0000: begin out = 4'b1000; valid = 1'b1; end
            16'b0000_0010_0000_0000: begin out = 4'b1001; valid = 1'b1; end
            16'b0000_0100_0000_0000: begin out = 4'b1010; valid = 1'b1; end
            16'b0000_1000_0000_0000: begin out = 4'b1011; valid = 1'b1; end
            16'b0001_0000_0000_0000: begin out = 4'b1100; valid = 1'b1; end
            16'b0010_0000_0000_0000: begin out = 4'b1101; valid = 1'b1; end
            16'b0100_0000_0000_0000: begin out = 4'b1110; valid = 1'b1; end
            16'b1000_0000_0000_0000: begin out = 4'b1111; valid = 1'b1; end
            default: begin
                out = 4'b0000; // Set output to default if no valid input
                valid = 1'b0;  // Set valid flag to 0
            end
        endcase
    end
endmodule

