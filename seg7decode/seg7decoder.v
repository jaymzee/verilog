module seg7decoder (
    input wire [3:0] data,
    output reg [6:0] segments
);

always @(*) begin
    case(data)     // ABCDEFG
    0:  segments = 7'b1111110;
    1:  segments = 7'b0110000;
    2:  segments = 7'b1101101;
    3:  segments = 7'b1111001;
    4:  segments = 7'b0110011;
    5:  segments = 7'b1011011;
    6:  segments = 7'b1011111;
    7:  segments = 7'b1110000;
    8:  segments = 7'b1111111;
    9:  segments = 7'b1110011;
    default:
        segments = 7'b0000000;
    endcase
end

endmodule
