module column_choosing_FSM(
    input right,
    input left,
    input reset,
    input clk,
    input sel_column,
    output [2:0] A
    );
    wire t0;
    wire t1;
    wire t2;
    assign t0 = (~A[2] & right & ~left) | (~A[1] & right & ~left) | (A[0] & ~right & left) | (A[1] & ~right & left) | (A[2] & ~right & left);
    assign t1 = (~A[0] & ~right & left) | (A[0] & right & ~left) | (A[2] & A[1] & right & ~left);
    assign t2 = (~A[1] & ~A[0] & ~right & left) | (A[1] & A[0] & right & ~left) | (A[2] & A[1] & right & ~left);
    T_FF tff0(t0, clk, reset, sel_column, A[0]);
    T_FF tff1(t1, clk, reset, sel_column, A[1]);
    T_FF tff2(t2, clk, reset, sel_column, A[2]);
endmodule