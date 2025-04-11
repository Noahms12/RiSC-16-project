module instruction_memory (
    input clk,        // Clock
    input reg [15:0] addr,  // Instruction address
    output reg [15:0] instr  // Instruction read
);

    parameter MEM_DEPTH = 65536;
    reg [15:0] rom [0:255];

    initial begin
        $readmemb("instructions.mem",rom);
    end
  
    always @(addr) begin
        instr = mem[addr[7:0]];
    end	

endmodule