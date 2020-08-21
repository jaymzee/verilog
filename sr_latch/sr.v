module sr(
    input s,
    input r,
    output q,
    output q_
);

nand(q_, r, q);
nand(q, s, q_);

endmodule
