module data_memory (
    input clk,        // Clock
    input sw,         // Store word
    input reg [15:0] addr,  // Memory address
    input reg [15:0] reg,   // Data to write
    output reg [15:0] rdata  // Data read
);

parameter MEM_DEPTH = 65536;

    // Memory array
    reg [15:0] mem [0:MEM_DEPTH-1];

    always_ff @(posedge clk) begin
        if (sw) begin
            // Write operation
            mem[addr] <= reg;
        end
    end

    // Read operation
    assign rdata = mem[addr];

endmodule