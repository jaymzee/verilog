module our (clk);
    input clk;  // Clock is required to get initial activation
    always @ (posedge clk) begin
        $display("Hello world");
        $finish;
    end
endmodule
