`timescale 1ns / 1ps

module game(
    input clk,
    input reset,
    input right,
    input left,
    input enter,
    output [11:0] col1,
    output [11:0] col2,
    output [11:0] col3,
    output [11:0] col4,
    output [11:0] col5,
    output [11:0] col6,
    output [11:0] col7,
    output [2:0] A,
    output player_colour,
    output change,
    output sel_column,
    output [1:0] win
    );
    T_FF player(change, clk, reset, change, player_colour);
    game_FSM mainfsm(clk, reset, enter, win, change, sel_column);
    update_and_check_win checker(player_colour, change, sel_column, right, left, clk, reset, win, col1, col2, col3, col4, col5, col6, col7, A);
    
endmodule