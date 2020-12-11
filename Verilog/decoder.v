module decoder(
    input [2:0] F,
    output [6:0] O
    );
    assign O[0] = ~F[2] & ~F[1] & ~F[0];
    assign O[1] = ~F[2] & ~F[1] & F[0];
    assign O[2] = ~F[2] & F[1] & ~F[0];
    assign O[3] = ~F[2] & F[1] & F[0];
    assign O[4] = F[2] & ~F[1] & ~F[0];
    assign O[5] = F[2] & ~F[1] & F[0];
    assign O[6] = F[2] & F[1] & ~F[0];
endmodule