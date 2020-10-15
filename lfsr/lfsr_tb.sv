`include "lfsr.sv"
module lfsr_tb();

logic clk, rst_;
logic [1:0] data;

initial begin
    $dumpfile("lfsr.vcd");
    $dumpvars(0, lfsr_tb);
    clk = 0;
    rst_ = 1;
#1  rst_ = 0;
#9  rst_ = 1;
#500 $finish;
end

always #5 clk = ~clk;

lfsr #(5, 'h12, 'h9) U1(
    .clk(clk),
    .rst_(rst_),
    .out(data[0])
);

lfsr #(5, 'h1D, 'hC) U2(
    .clk(clk),
    .rst_(rst_),
    .out(data[1])
);

endmodule
