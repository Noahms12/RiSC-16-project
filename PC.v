module PC (
    input clk,
    input reset,
    input [1:0] MUXpc_sel,               
    input [15:0] pc_plus1,        
    input [15:0] pc_plus1_imm,     
    output reg [15:0] pc_out       
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 16'b0;
        else begin
            case (MUXpc_sel)
                2'b00: pc_out <= pc_plus1;        
                2'b01: pc_out <= pc_plus1_imm;       
            endcase
        end
    end

endmodule
