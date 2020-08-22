module switch;


wire c;
reg a, b, d, e;

and (pull1, strong0) (c, a, b);
and (pull1, strong0) (c, d, e);


initial begin
    $display("a b d e c");
    $monitor("%b %b %b %b %b %v", a, b, d, e, c, c);
    a = 0;
    b = 0;
    d = 0;
    e = 0;
#5  a = 1;
#5  b = 1;
#5  d = 1;
#5  e = 1;
#5  a = 0;
#5  $finish;
end

endmodule
