`timescale 1s / 100ms
`include "traffic_light.sv"

module traffic_light_tb;

logic clk;
logic rst;
logic red;
logic green;
logic yellow;

traffic_light #(.RED(10), .GREEN(12), .YELLOW(4)) uut(
    .clk(clk),
    .rst(rst),
    .red(red),
    .green(green),
    .yellow(yellow)
);

always #0.5 clk = ~clk;

initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);
    rst = 1;
    clk = 0;
#5  rst = 0;
#280 $finish();
end

endmodule
