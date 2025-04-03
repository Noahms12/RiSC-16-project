module ALU (
    input [8:0] a,
    input [8:0] b,
    input [1:0] sel,
    output reg [8:0] result
);

always @(*) begin
    case (sel)
        2'b00: result = a + b;             // Addition
        2'b01: result = ~(a & b);          // NAND
        2'b10: result = (a == b) ? 9'b111111111 : 9'b000000000; // Equality check
        2'b11: result = a;                 // Pass-through
        default: result = 9'b000000000;     // Default case
    endcase
end

endmodule
