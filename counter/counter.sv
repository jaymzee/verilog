module counter (
    input logic clk,
    input logic rst_,
    input logic en_,
    input logic up,
    output logic [WIDTH-1:0] count
);

parameter WIDTH = 4;

always_ff @(posedge clk, negedge rst_)
    if (!rst_)
        count = 0;
    else
        if (!en_)
            if (up)
                count = count + 1;
            else
                count = count - 1;

endmodule
