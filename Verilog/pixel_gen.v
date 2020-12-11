module pixel_gen(
  input clk_d,
  input [9:0] pixel_x,
  input [9:0] pixel_y,
  input video_on,
  input [11:0] col1,
  input [11:0] col2,
  input [11:0] col3,
  input [11:0] col4,
  input [11:0] col5,
  input [11:0] col6,
  input [11:0] col7,
  input [2:0] A,
  input player_colour,
  output reg [3:0] red=0,
  output reg [3:0] green=0,
  output reg [3:0] blue=0
);
    wire [11:0] col [6:0];
    assign col[6] = col7;
    assign col[5] = col6;
    assign col[4] = col5;
    assign col[3] = col4;
    assign col[2] = col3;
    assign col[1] = col2;
    assign col[0] = col1;
    integer col_num;
    integer row_num1;
    integer row_num2;
    reg occupied;
    reg colour;
  always @(posedge clk_d) begin
    if (pixel_x >=1 && pixel_x <=90)
        col_num = 0;
    else if (pixel_x >=93 && pixel_x <=181)
        col_num = 1;
    else if (pixel_x >=184 && pixel_x <=273)
        col_num = 2;
    else if (pixel_x >=276 && pixel_x <=364)
        col_num = 3;
    else if (pixel_x >=367 && pixel_x <=456)
        col_num = 4;
    else if (pixel_x >=459 && pixel_x <=547)
        col_num = 5;
    else if (pixel_x >=550 && pixel_x <=638)
        col_num = 6;
    else
        col_num = -1;
    if (pixel_y >=1 && pixel_y <= 67) begin
        row_num1 = 0;
        row_num2 = 1;
    end
    else if (pixel_y >=70 && pixel_y <= 136) begin
        row_num1 = 2;
        row_num2 = 3;
    end
    else if (pixel_y >=139 && pixel_y <= 204) begin
        row_num1 = 4;
        row_num2 = 5;
    end
    else if (pixel_y >=207 && pixel_y <= 273) begin
        row_num1 = 6;
        row_num2 = 7;
    end
    else if (pixel_y >=276 && pixel_y <= 341) begin
        row_num1 = 8;
        row_num2 = 9;
    end
    else if (pixel_y >=344 && pixel_y <= 410) begin
        row_num1 = 10;
        row_num2 = 11;
    end
    else begin
        row_num1 = -1;
        row_num2 = -1;
    end
    if (
    (pixel_x ==0) || (pixel_x ==639) ||
    (((pixel_x ==91) || (pixel_x ==92) ||
    (pixel_x ==182) || (pixel_x ==183) ||
    (pixel_x ==274) || (pixel_x ==275) ||
    (pixel_x ==365) || (pixel_x ==366) ||
    (pixel_x ==457) || (pixel_x ==458) ||
    (pixel_x ==548) || (pixel_x ==549)) && (pixel_y >=69)) ||
    (pixel_y ==0) || (pixel_y ==479) ||
    (pixel_y ==68) || (pixel_y ==69) ||
    (pixel_y ==137) || (pixel_y ==138) ||
    (pixel_y ==205) || (pixel_y ==206) ||
    (pixel_y ==274) || (pixel_y ==275) ||
    (pixel_y ==342) || (pixel_y ==343) ||
    (pixel_y ==411) || (pixel_y ==412)
    ) 
      begin
      	red <= 4'hF;
      	green <= 4'hF;
      	blue <= 4'hF;
      end
    else if (video_on && (col_num >= 0 && row_num1 >= 0 && row_num2 >= 0))
      begin
        occupied = col[col_num][row_num2];
        colour = col[col_num][row_num1];
        if (occupied == 1'b0) begin
            red <= (4'h0);
            green <= (4'h0);
            blue <= (4'h0);
        end
        else if (colour == 1'b0) begin
            red <= (4'h0);
            green <= (4'h0);
            blue <= (4'hF);
        end
        else begin
            red <= (4'hF);
            green <= (4'h0);
            blue <= (4'h0);
        end
      end
    else if ((col_num == 0 && A == 3'd0  || col_num == 1 && A == 3'd1 || col_num == 2 && A == 3'd2 || col_num == 3 && A == 3'd3 || col_num == 4 && A == 3'd4 || col_num == 5 && A == 3'd5 || col_num == 6 && A == 3'd6)&& video_on) begin
        if (player_colour) begin
            red <= (4'hF);
            green <= (4'h0);
            blue <= (4'h0);
        end
        else begin
            red <= (4'h0);
            green <= (4'h0);
            blue <= (4'hF);
        end
    end
    else
      begin
        red <= (4'h0);
        green <= (4'h0);
        blue <= (4'h0);
      end
  end
endmodule
