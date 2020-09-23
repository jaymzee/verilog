module sr(
    input s_,
    input r_,
    output q,
    output q_
);

nand(q_, r_, q);
nand(q, s_, q_);

endmodule
