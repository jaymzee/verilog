`timescale 10ns / 1ns
`include "counter.sv"
module counter_tb();

logic clk, rst_, en_, up;
logic [4:0] count;

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, counter_tb);
    $monitor("rst* %b en* %b dir %b count %b (%d)",
              rst_, en_, up, count, count);
    clk = 0;
    up = 1;
    en_ = 0;
    rst_ = 1;
#1  rst_ = 0;
#9  rst_ = 1;
#200 up = 0;
#180 rst_ = 0;
#10  $finish;
end

always #5 clk = ~clk;

counter #(.WIDTH(5)) U1(
    .clk(clk),
    .rst_(rst_),
    .en_(en_),
    .up(up),
    .count(count)
);

endmodule
