module lfsr (
    input logic clk,
    input logic rst_,
    output logic [3:0] out
);

always_ff @(posedge clk, negedge rst_)
    if (!rst_)
        out <= 9;
    else
        if (out[0])
            out <= (out >> 1) ^ 'hC;
        else
            out <= out >> 1;

endmodule
