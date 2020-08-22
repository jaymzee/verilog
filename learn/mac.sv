module mac;

function signed [7:0] mac;
    input [7:0] x;
    input [7:0] y;
    input [7:0] z;
    mac = x * y + z;
endfunction

logic data;

initial begin
    $dumpfile("mac.vcd");
    $dumpvars(0, mac);
    $display("data");
    $monitor("%b", data);
    data = #5 1;
    data = #5 0;
    data = #5 1;
    data = #5 0;
    #5 $finish;
end

initial begin : whatever
    for(int i = 0; i < 10; i = i + 1) begin
        $display("%d", mac(i,-1,-4));
        i = #1 i;
    end
end

endmodule
