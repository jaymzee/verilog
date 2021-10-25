`include "params.v"
// fpga4student.com 
// FPGA projects, VHDL projects, Verilog projects 
// Verilog code for RISC Processor 
// Verilog code for Instruction Memory
module InstructionMemory(
    input[15:0] pc,
    output[15:0] instruction
);

reg [`COLS-1:0] memory [`ROWS_I-1:0];
wire [3:0] rom_addr = pc[4:1];

initial begin
    $readmemb("./test/test.prog", memory, 0, 14);
end

assign instruction = memory[rom_addr];

endmodule
