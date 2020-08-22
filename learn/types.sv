module types(a, b, c);

input logic a, b;
output logic c;

always @(*)
    c = a ^ b;

logic [3:0] data;
integer integer32;
int int32;
longint int64;
shortint int16;
byte int8;
logic [63:0] integer64;
bit [127:0] int128;
bit [255:0] int256;
bit [511:0] int512;

int signed sint;
int unsigned uint;

function [32:0] square;
    input [32:0] x;
    begin
        int y;
        y = x;
        square = y * y;
    end
endfunction


initial begin
    data = 255;
    integer32 = 32'hdeaxbeez;
    integer64 = 64'hdeadbeefcafebabx;
    int32 = 2;
    int64 = 3;
    int16 = 4;
    int8 = 8'o377;
    int128 = 6;
    int256 = 7;
    int512 = 8;
    $display("decimal   %d", data);
    $display("octal     0%o", data);
    $display("hex       0x%x", data);
    $display("binary    0b%b", data);
    $display("integer32 0x%x", integer32);
    $display("integer64 0x%x %d", integer64, integer64);
    $display("int8      0x%x", int8);
    $display("int16     0x%x", int16);
    $display("int32     0x%x", int32);
    $display("int64     0x%x", int64);
    $display("int128    0x%x", int128);
    $display("int256    0x%x", int256);
    $display("int512    0x%x", int512);
    $display("%d", square(5));

    uint = 'hffffffff;
    sint = 'hffffffff;
    $display("%d", uint);
    $display("%d", sint);
end

endmodule
