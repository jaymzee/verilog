`include "seg7decoder.v"

module seg7decoder_tb;

reg [3:0] data;
wire [6:0] segments;

initial begin
    $display("                 ABCDEFG");
    $monitor("data %d segments %b", data, segments);
    data = 0;
    #50 $finish();
end

always #5 data = data + 1;

seg7decoder U1 (
    .data(data),
    .segments(segments)
);

endmodule
