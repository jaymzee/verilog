module counter (
    input wire clk,
    input wire rst,
    input wire en,
    input wire dir,
    output reg [3:0] count
);

always @(posedge clk, posedge rst)
    if (rst)
        count = #0.5 0;
    else
        if (en)
            if (dir)
                count = #0.5 count + 1;
            else
                count = #0.5 count - 1;

endmodule