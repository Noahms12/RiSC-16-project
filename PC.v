module PC (
    input clk,
    input reset,
    input [1:0] MUXpc_sel,         // selects PC+1, PC+1+imm
    input [15:0] pc_plus1,         // PC + 1
    input [15:0] pc_plus1_imm,     // PC + 1 + imm
    output reg [15:0] pc_out       // current PC value
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 16'b0;
        else begin
            case (MUXpc_sel)
                2'b00: pc_out <= pc_plus1;        // Normal increment
                2'b01: pc_out <= pc_plus1_imm;    // Branch (BEQ)      
            endcase
        end
    end

endmodule
