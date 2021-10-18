module fifo (
    input logic clk,
    input logic rd,
    input logic wr,
    input logic en,
    input logic rst,
    input logic [31:0] dataIn,
    output logic [31:0] dataOut,
    output logic full,
    output logic empty
);

logic [3:0] count = 0;
logic [2:0] rd_addr = 0, wr_addr = 0;
logic [31:0] fifo[7:0];

assign empty = count == 0 ? 1 : 0;
assign full = count == 8 ? 1 : 0;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        rd_addr = 0;
        wr_addr = 0;
        count = 0;
    end

    if (en)
        if (rd && count > 0) begin
            dataOut = fifo[rd_addr];
            rd_addr = (rd_addr + 1) % 8;
            count = count - 1;
        end else if (wr && count < 8) begin
            fifo[wr_addr] = dataIn;
            wr_addr = (wr_addr + 1) % 8;
            count = count + 1;
        end
end

endmodule
