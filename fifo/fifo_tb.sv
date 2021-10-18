`timescale 1ns / 100ps
`include "fifo.sv"

module fifo_tb;

logic clk;
logic rd;
logic wr;
logic en;
logic rst;
logic [7:0] dataIn;

logic [7:0] dataOut;
logic empty;
logic full;

fifo #(.DWIDTH(8), .AWIDTH(3)) U1(
    .clk(clk),
    .dataIn(dataIn),
    .rd(rd),
    .wr(wr),
    .en(en),
    .rst(rst),
    .dataOut(dataOut),
    .empty(empty),
    .full(full)
);

always #10 clk = ~clk;

initial begin
    $dumpfile("fifo.vcd");
    $dumpvars(0, fifo_tb);
    clk = 0;
    dataIn = 32'h0;
    rd = 0;
    wr = 0;
    en = 0;
    rst = 1;
#40
    en = 1;
    rst = 1;
#20 rst = 0;
    wr = 1;
    dataIn = 0;
#20 dataIn = 1;
#20 dataIn = 2;
#20 dataIn = 3;
#20 dataIn = 4;
#20 dataIn = 5;
#20 dataIn = 6;
#20 dataIn = 7;
#20 wr = 0;
    rd = 1;
#200
    $finish();
end

endmodule
