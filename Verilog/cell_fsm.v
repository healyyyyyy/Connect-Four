module cell_fsm(
    input column,
    input cell_,
    input change,
    input player_colour,
    input clk,
    input reset,
    input [1:0] win,
    output [1:0] cell_colour
    );
    wire col_cel_change;
    assign col_cel_change = column & cell_ & change;
    wire D2;
    wire D1;
    assign D2 = col_cel_change | cell_colour[1] | win[1];
    D_ff ff2(D2, clk, reset, cell_colour[1]);
    D_ff ff1(D1, clk, reset, cell_colour[0]);
    assign D1 = (win[1] & win[0]) | (cell_colour[0] & ~win[1]) | (~cell_colour[1] & player_colour & col_cel_change & ~win[1]);
endmodule