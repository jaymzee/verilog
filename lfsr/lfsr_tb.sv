`include "lfsr.sv"
module lfsr_tb();

logic clk, rst_;
logic [3:0] out;

initial begin
    $dumpfile("lfsr.vcd");
    $dumpvars(0, lfsr_tb);
    $monitor("rst* %b out %b %x", rst_, out, out);
    clk = 0;
    rst_ = 1;
#1  rst_ = 0;
#9  rst_ = 1;
#200 $finish;
end

always #5 clk = ~clk;

lfsr U1(
    .clk(clk),
    .rst_(rst_),
    .out(out)
);

endmodule
