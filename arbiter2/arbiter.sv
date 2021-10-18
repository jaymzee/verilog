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

parameter SIZE = 3;
parameter IDLE = 3'b100, GNT0 = 3'b001, GNT1 = 3'b010;

logic [SIZE-1:0] state;      // Seq part of the FSM
logic [SIZE-1:0] next_state; // combo part of FSM

// FSM outputs
// state is 1-hot encoded, so gnt line logic is trivial
// model combinational logic with inertial delay
assign #1 gnt_0 = state[0];
assign #1 gnt_1 = state[1];

/*
 * alternatively can use always blocks to model combinational logic
 * but delays should still be modeled using continuous assignment.
 * So it's often simpler to just use continuous assignment for combo
 * logic unless that logic is complex.
 *
always_comb begin
    case(state)
    GNT0:   begin
                gnt_0 = 1;
                gnt_1 = 0;
            end
    GNT1:   begin
                gnt_0 = 0;
                gnt_1 = 1;
            end
    default:begin  // IDLE
                gnt_0 = 0;
                gnt_1 = 0;
            end
    endcase
end
*/

// FSM next state
// model ff output with transport delay
always_ff @(posedge clock) begin : FSM
    if (reset == 1'b1)
        state <= IDLE;
    else
        case(state)
        IDLE:
            if (req_0 == 1'b1)
                state <= #1 GNT0;
            else if (req_1 == 1'b1)
                state <= #1 GNT1;
            else
                state <= #1 IDLE;
        GNT0:
            if (req_0 == 1'b1)
                state <= #1 GNT0;
            else
                state <= #1 IDLE;
        GNT1:
            if (req_1 == 1'b1)
                state <= #1 GNT1;
            else
                state <= #1 IDLE;
        default:
            state <= #1 IDLE;
        endcase
end

endmodule
