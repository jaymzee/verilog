`timescale 1ns / 1ps
`include "params.v"
`include "risc16.v"

// fpga4student.com 
// FPGA projects, VHDL projects, Verilog projects 
// Verilog code for RISC Processor 
// Verilog testbench code to test the processor
module test_Risc_16_bit;

// Inputs
reg clk;

// Instantiate the Unit Under Test (UUT)
Risc_16_bit uut (
    .clk(clk)
);

initial begin
    $dumpfile("risc16.vcd");
    $dumpvars(0, test_Risc_16_bit);
    clk = 0;
    `SIMULATION_TIME;
    $finish;
end

always begin
#5  clk = ~clk;
end

endmodule
