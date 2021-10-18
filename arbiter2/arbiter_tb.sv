`include "arbiter.sv"
module top ();

logic   clk;
logic   rst;
logic   req1;
logic   req0;
logic   gnt1;
wire    gnt0;

// Clock generator
always #10 clk = ~clk;

initial begin
    $dumpfile ("arbiter.vcd");
    $dumpvars(0, top);
    clk = 0;
    rst = 1;
    req0 = 0;
    req1 = 0;
#100 rst = 0;
    repeat (1) @(negedge clk);
    req0 <= 1;
    repeat (1) @(negedge clk);
    req0 <= 0;
    repeat (1) @(negedge clk);
    req0 <= 1;
    req1 <= 1;
    repeat (1) @(negedge clk);
    req0 <= 0;
    repeat (1) @(negedge clk);
    repeat (1) @(negedge clk);
    repeat (1) @(negedge clk);
    req1 <= 0;
    repeat (1) @(negedge clk);
    repeat (1) @(negedge clk);
#100 $finish;
end 

// Connect the DUT
arbiter U1 (
    .clock(clk),
    .reset(rst),
    .req_1(req1),
    .req_0(req0),
    .gnt_1(gnt1),
    .gnt_0(gnt0)
);

endmodule
