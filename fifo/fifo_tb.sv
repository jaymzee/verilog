`timescale 1ns / 1ns
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
    dataIn = 0;
    rd = 0;
    wr = 0;
    en = 0;
    rst = 1;
#20 rst = 0;
#20 en = 1;
    wr = 1;
    for (int i = 1; i <= 8; i++) begin
        dataIn = i;
        #20;
    end
    wr = 0;
    rd = 1;
#160
    rd = 0;
    en = 0;
#40 en = 1;
    wr = 1;
    dataIn = 8'hf;
    for (int i = 8'he; i >= 8; i--) begin
    #20 dataIn = i;
        rd = 1;
    end
#20 wr = 0;
#20 rd = 0;
#40 $finish();
end

endmodule
