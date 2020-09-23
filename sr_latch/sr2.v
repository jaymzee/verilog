module sr2(
    input wire s_,
    input wire r_,
    output reg q,
    output q_
);

assign q_ = ~q;

always @*
    if (!s_)
        q = 1;
    else if (!r_)
        q = 0;

endmodule
