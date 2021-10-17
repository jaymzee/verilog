//====================================================
// This is FSM demo program using single always
// for both seq and combo logic
//=====================================================
module arbiter (
input logic clock      , // clock
input logic reset      , // Active high, syn reset
input logic req_0      , // Request 0
input logic req_1      , // Request 1
output logic gnt_0      , // Grant 0
output logic gnt_1
);

//=============Internal Constants======================
parameter SIZE = 3;
parameter IDLE = 3'b001, GNT0 = 3'b010, GNT1 = 3'b100;

//=============Internal Variables======================
logic [SIZE-1:0] state;      // Seq part of the FSM
logic [SIZE-1:0] next_state; // combo part of FSM

//==========Code startes Here==========================
always_ff @(posedge clock) begin : FSM
    if (reset == 1'b1) begin
        state <= IDLE;
        gnt_0 <= 0;
        gnt_1 <= 0;
    end else
        case(state)
        IDLE:
            if (req_0 == 1'b1) begin
                state <= GNT0;
                gnt_0 <= 1;
            end else if (req_1 == 1'b1) begin
                gnt_1 <= 1;
                state <= GNT1;
            end else begin
                state <= IDLE;
            end
        GNT0:
            if (req_0 == 1'b1) begin
                state <= GNT0;
            end else begin
                gnt_0 <= 0;
                state <= IDLE;
            end
        GNT1:
            if (req_1 == 1'b1) begin
                state <= GNT1;
            end else begin
                gnt_1 <= 0;
                state <= IDLE;
            end
        default:
            state <= IDLE;
        endcase
end

endmodule
