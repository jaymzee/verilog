`include "decode2to4.sv"
module decode2to4_tb;

logic [1:0] a;
logic [3:0] b;

initial begin
    $monitor("a=%b, b=%b", a, b);
    a = 2'b00;
#1  a = 2'b01;
#2  a = 2'b10;
#3  a = 2'b11;
    $finish;
end

decode2to4 U1 (
    .in(a),
    .out(b)
);

endmodule
