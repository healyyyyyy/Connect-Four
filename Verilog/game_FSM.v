module game_FSM(
    input clk,
    input reset,
    input enter,
    input [1:0] win,
    output change,
    output sel_column
    );
    wire q2;
    wire q1;
    wire d2;
    wire d1;
    wire won;
    assign won = win[1];
    assign d1 = (~q1 & enter) | (q1 & ~enter) | (q2 & ~q1);
    assign d2 = (~q2 & q1 & enter) | (q2 & ~q1 & won) | (q2 & q1 & ~enter);
    D_ff ff1(d1, clk, reset, q1);
    D_ff ff2(d2, clk, reset, q2);
    
    assign change = q2 & ~q1;
    assign sel_column = ~q2 & q1;
endmodule