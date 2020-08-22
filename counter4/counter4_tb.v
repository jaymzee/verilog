`timescale 10ns / 1ns
module counter4_tb();

reg clk, rst, en, up;
wire [3:0] count1, count2;
wire #0.5 up_ = ~up;

counter4 U1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .up(up),
    .count(count1)
);

counter4 U2(
    .clk(clk),
    .rst(rst),
    .en(en),
    .up(up_),
    .count(count2)
);

initial begin
    $dumpfile("counter4.vcd");
    $dumpvars(1, U1);
    $dumpvars(1, U2);
    $monitor("rst %b en %b dir %b cnt1 %b cnt2 %b",
              rst, en, up, count1, count2);
    clk = 0;
    up = 1;
    en = 1;
    rst = 1;
#10 rst = 0;
#100 up = 0;
#80  rst = 1;
#10  $finish;
end

always #5 clk = ~clk;

endmodule
