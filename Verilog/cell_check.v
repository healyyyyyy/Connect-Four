module cell_check(
    input [1:0] c1,
    input [1:0] c2,
    input [1:0] c3,
    input [1:0] c4,
    output [1:0] win
    );
    wire blue_win;
    wire red_win;
    reg [1:0] win_;
    and g1(red_win, c1[1], c2[1], c3[1], c4[1], c1[0], c2[0], c3[0], c4[0]);
    and g2(blue_win, c1[1], c2[1], c3[1], c4[1], ~c1[0], ~c2[0], ~c3[0], ~c4[0]);
    initial begin
        if (blue_win) begin
            win_ = 2'b10;  
        end
        else if (red_win) begin
            win_ = 2'b11;
        end
        else begin
            win_ = 2'b00;
        end 
    end
    assign win = win_;
endmodule
