`timescale 1ns / 1ps
//fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog code for 16-bit RISC processor
// ALU_Control Verilog code
module AluControl (
    alu_control,
    alu_op,
    opcode
);

input [1:0] alu_op;
input [3:0] opcode;
output reg[2:0] alu_control;

wire [5:0] ALUControlIn;

assign ALUControlIn = {alu_op, opcode};

always @(ALUControlIn)
    casex (ALUControlIn)
    6'b10xxxx: alu_control = 3'b000;
    6'b01xxxx: alu_control = 3'b001;
    6'b000010: alu_control = 3'b000;
    6'b000011: alu_control = 3'b001;
    6'b000100: alu_control = 3'b010;
    6'b000101: alu_control = 3'b011;
    6'b000110: alu_control = 3'b100;
    6'b000111: alu_control = 3'b101;
    6'b001000: alu_control = 3'b110;
    6'b001001: alu_control = 3'b111;
    default: alu_control = 3'b000;
    endcase

endmodule
