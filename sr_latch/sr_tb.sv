module sr_tb;

logic s, r;
wire q, q_;

initial begin
    s = 1;
    r = 1;
    $display("s r q q_");
    $monitor("%b %b %b %b", s, r, q, q_);
    #5 r = 0;
    #5 r = 1;
end


sr U1 (
    .s(s),
    .r(r),
    .q(q),
    .q_(q_)
);

endmodule
