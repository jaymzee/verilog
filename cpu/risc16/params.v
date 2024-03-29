`ifndef PARAMETER_H_
`define PARAMETER_H_
// fpga4student.com
// FPGA projects, VHDL projects, Verilog projects
// Verilog code for RISC Processor
// Parameter file
`define COLS 16     // 16 bits instruction memory, data memory
`define ROWS_I 15   // instruction memory, instructions number, this number
                    // can be changed. Adding more instructions to verify
                    // your design is a good idea.
`define ROWS_D 8    // The number of data in data memory. We only use 8 data.
                    // Do not change this number. You can change the value of
                    // each data inside test.data file. Total number is fixed
                    // at 8.
`define FILENAME "./test/50001111_50001212.o"
`define SIMULATION_TIME #160

`endif
