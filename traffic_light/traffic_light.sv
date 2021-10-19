module traffic_light (
    input logic rst,
    input logic clk,
    output logic red,
    output logic yellow,
    output logic green
);

parameter RED = 5;
parameter YELLOW = 3;
parameter GREEN = 7;

logic [7:0] timer;

always_ff @(posedge clk, posedge rst)
    if (rst) begin
        green <= 0;
        yellow <= 0;
        red <= 1;
        timer <= 5;
    end else begin
        if (timer > 1)
            timer <= timer - 1;
        else
            if (red) begin
                red <= 0;
                green <= 1;
                timer <= GREEN;
            end else if (green) begin
                green <= 0;
                yellow <= 1;
                timer <= YELLOW;
            end else if (yellow) begin
                yellow <= 0;
                red <= 1;
                timer <= RED;
            end
    end

endmodule
