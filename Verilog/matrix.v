module matrix(
    input [6:0] O,
    input player_colour,
    input change,
    input clk,
    input reset,
    input [1:0] win,
    output [11:0] col1,
    output [11:0] col2,
    output [11:0] col3,
    output [11:0] col4,
    output [11:0] col5,
    output [11:0] col6,
    output [11:0] col7
    );
    column c1(O[0], player_colour, change, win, clk, reset, col1);
    column c2(O[1], player_colour, change, win, clk, reset, col2);
    column c3(O[2], player_colour, change, win, clk, reset, col3);
    column c4(O[3], player_colour, change, win, clk, reset, col4);
    column c5(O[4], player_colour, change, win, clk, reset, col5);
    column c6(O[5], player_colour, change, win, clk, reset, col6);
    column c7(O[6], player_colour, change, win, clk, reset, col7);
endmodule