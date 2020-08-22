module multiple_driver;

reg logic a, b;
tri logic c;

xnor #(1,2) (c, a, b);
xor #(1,2) (c, a, b);
//assign c = ~(a ^ b);


initial begin

    $dumpfile("multiple_driver.vcd");
    $dumpvars(0, multiple_driver);
    $display("   t a b c n");
    $monitor("%4d %b %b %b", $time, a, b, c);
    a = 0;
    b = 0;
#5  a = 1;
#5  b = 1;
#5  a = 0;
#5  $finish;
end

endmodule
