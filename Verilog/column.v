module column(
    input column_,
    input player_colour,
    input change,
    input [1:0] win,
    input clk,
    input reset,
    output [11:0] column_vector
    );
    wire [2:0] X;
    wire [6:0] O;
    wire [5:0] cell_occupied;
    
    assign cell_occupied[5] = column_vector[11];
    assign cell_occupied[4] = column_vector[9];
    assign cell_occupied[3] = column_vector[7];
    assign cell_occupied[2] = column_vector[5];
    assign cell_occupied[1] = column_vector[3];
    assign cell_occupied[0] = column_vector[1];
    
    cell_fsm c0(column_, O[1], change, player_colour, clk, reset, win, column_vector[1:0]);
    cell_fsm c1(column_, O[2], change, player_colour, clk, reset, win, column_vector[3:2]);
    cell_fsm c2(column_, O[3], change, player_colour, clk, reset, win, column_vector[5:4]);
    cell_fsm c3(column_, O[4], change, player_colour, clk, reset, win, column_vector[7:6]);
    cell_fsm c4(column_, O[5], change, player_colour, clk, reset, win, column_vector[9:8]);
    cell_fsm c5(column_, O[6], change, player_colour, clk, reset, win, column_vector[11:10]);
    
    cell_selector sel(cell_occupied[0], cell_occupied[1], cell_occupied[2], cell_occupied[3], cell_occupied[4], cell_occupied[5], X);
    decoder d1(X, O);
endmodule