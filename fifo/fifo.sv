module fifo (
    input logic clk,
    input logic rd,
    input logic wr,
    input logic en,
    input logic rst,
    input logic [DWIDTH-1:0] dataIn,
    output logic [DWIDTH-1:0] dataOut,
    output logic full,
    output logic empty
);

parameter DWIDTH = 8;
parameter AWIDTH = 3;
localparam DEPTH = 1 << AWIDTH;
localparam HIZ = {DWIDTH{1'bz}};

logic [AWIDTH:0] count = 0;
logic [AWIDTH-1:0] rd_addr = 0, wr_addr = 0;
logic [DWIDTH-1:0] fifo[DEPTH-1:0];

assign empty = (count == 0) ? 1 : 0;
assign full = (count == DEPTH) ? 1 : 0;

always @(posedge clk, posedge rst) begin
    if (rst)
        begin
            rd_addr <= 0;
            wr_addr <= 0;
            count <= 0;
            dataOut <= HIZ;
        end
    else if (en)
        begin
            if (rd && count > 0)
                begin
                    dataOut <= fifo[rd_addr];
                    rd_addr <= (rd_addr + 1) % DEPTH;
                    if (!wr)
                        count <= count - 1;
                end
            else
                dataOut <= HIZ;

            if (wr && count < DEPTH)
                begin
                    fifo[wr_addr] <= dataIn;
                    wr_addr <= (wr_addr + 1) % DEPTH;
                    if (!rd)
                        count <= count + 1;
                end
        end
    else
        dataOut <= HIZ;
end

endmodule
