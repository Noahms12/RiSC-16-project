module risc_register_file (
    input  wire        clk,
    input  wire        we,             // Write enable
    input  wire        reset,
    input  wire [2:0]  read_reg1,
    input  wire [2:0]  read_reg2,
    input  wire [2:0]  write_reg,
    input  wire [15:0] write_data,
    output wire [15:0] read_data1,
    output wire [15:0] read_data2
);

    // Eight 16-bit registers
    reg [15:0] regs [7:0];

    integer i;
    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            for (i = 0; i < 8; i = i + 1)
                regs[i] <= 16'h0000;
        end
        else if (we && (write_reg != 3'b000)) begin
            regs[write_reg] <= write_data;
        end
    end

    // Two read ports
    assign read_data1 = (read_reg1 == 3'b000) ? 16'h0000 : regs[read_reg1];
    assign read_data2 = (read_reg2 == 3'b000) ? 16'h0000 : regs[read_reg2];

endmodule
