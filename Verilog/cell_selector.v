module cell_selector(
    input [1:0] F,
    input [1:0] E,
    input [1:0] D,
    input [1:0] C,
    input [1:0] B,
    input [1:0] A,
    output [2:0] X
    );
    assign X[0] = ~F | (~D & E) | (~B & C);
    assign X[1] = (~D & F) | (~A &  B);
    assign X[2] = ~A & D;
endmodule