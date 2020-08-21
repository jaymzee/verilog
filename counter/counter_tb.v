`timescale 10ns / 1ns
module counter_tb();

reg clk, rst, en, dir;
wire [3:0] count1, count2;
wire #0.5 dirc = ~dir;

counter U1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .dir(dir),
    .count(count1)
);

counter U2(
    .clk(clk),
    .rst(rst),
    .en(en),
    .dir(dirc),
    .count(count2)
);

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(1, U1);
    $monitor("rst %b en %b dir %b cnt1 %b cnt2 %b",
              rst, en, dir, count1, count2);
    clk = 0;
    dir = 1;
    en = 1;
    rst = 1;
#10 rst = 0;
#100 dir = 0;
#80  rst = 1;
#10  $finish;
end

always #5 clk = ~clk;

endmodule
