module sr_tb;

logic s_, r_;
wire q, q_;

initial begin
    s_ = 1;
    r_ = 1;
    $display("s r q q_");
    $monitor("%b %b %b %b", s_, r_, q, q_);
#5  r_ = 0;
#5  r_ = 1;
#5  s_ = 0;
#5  s_ = 1;
end


sr U1 (
    .s_(s_),
    .r_(r_),
    .q(q),
    .q_(q_)
);

endmodule
