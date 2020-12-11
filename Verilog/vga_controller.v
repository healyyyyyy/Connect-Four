module vga_controller(clk, A, player_colour, col1, col2, col3, col4, col5, col6, col7, clk_d,h_sync,v_sync,red,green,blue);
  input clk;
  input [2:0] A;
  input player_colour;
  input [11:0] col1;
  input [11:0] col2;
  input [11:0] col3;
  input [11:0] col4;
  input [11:0] col5;
  input [11:0] col6;
  input [11:0] col7;
  output h_sync;
  output v_sync;
  output [3:0] red;
  output [3:0] green;
  output [3:0] blue;
  wire [9:0] h_counts;
  wire [9:0] v_counts;
  output clk_d;
  wire clk_D;
  wire trig_V;
  wire video_ON;
  wire [9:0] X_loc;
  wire [9:0] Y_loc;
  
  clk_div clock(.clk(clk),.clk_d(clk_D));
  
  
  Counter_10bit h_ct(.clk(clk_D),.h_count(h_counts),.trig_v(trig_V));
  
  
  v_Counter v1(.clk(clk_D),.v_enable(trig_V),.v_count(v_counts));
  
  
  vga_sync vg(.h_count(h_counts),.v_count(v_counts),.h_sync(h_sync),.v_sync(v_sync),.video_on(video_ON),.x_loc(X_loc),.y_loc(Y_loc));
  
  pixel_gen p1(.clk_d(clk_D),.pixel_x(X_loc),.pixel_y(Y_loc),.video_on(video_ON),.red(red),.green(green),.blue(blue), .col1(col1), .col2(col2), .col3(col3), .col4(col4), .col5(col5), .col6(col6), .col7(col7), .A(A), .player_colour(player_colour));
  assign clk_d=clk_D;
  
  
endmodule