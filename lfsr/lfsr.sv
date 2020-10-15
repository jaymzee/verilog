module lfsr (
    input logic clk,
    input logic rst_,
    output logic out
);

parameter WIDTH = 4;
parameter POLY = 'hC;
parameter IV = 'h1;

logic [WIDTH-1:0] v;

assign out = v[0];

always_ff @(posedge clk, negedge rst_)
    if (!rst_)
        v <= IV;
    else
        if (out)
            v <= (v >> 1) ^ POLY;
        else
            v <= v >> 1;

endmodule
