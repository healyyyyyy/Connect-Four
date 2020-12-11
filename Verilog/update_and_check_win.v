module update_and_check_win(
    input player_colour,
    input change,
    input sel_column,
    input right,
    input left,
    input clk,
    input reset,
    output [1:0] win,
    output [11:0] col1,
    output [11:0] col2,
    output [11:0] col3,
    output [11:0] col4,
    output [11:0] col5,
    output [11:0] col6,
    output [11:0] col7,
    output [2:0] A
    );
    wire [6:0] O;
    column_choosing_FSM FSM(right, left, reset, clk, sel_column, A);
    decoder d2(A, O);
    matrix m(O, player_colour, change, clk, reset, win, col1, col2, col3, col4, col5, col6, col7);
    win_check wc(col1, col2, col3, col4, col5, col6, col7, clk, win);
endmodule