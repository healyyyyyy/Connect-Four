module vga_sync(
  input [9:0] h_count,
  input [9:0] v_count,
  output h_sync,
  output v_sync,
  output video_on,
  output [9:0] x_loc,
  output [9:0] y_loc);
  //horizontal
  localparam HD = 640;
  localparam HF = 16;
  localparam HB = 48;
  localparam HR = 96;
  
  //vertical
  localparam VD = 480;
  localparam VF = 10;
  localparam VB = 33;
  localparam VR = 2;
  assign video_on = (h_count<640 && v_count<480);
  
  assign h_sync = ~(h_count>=656 && h_count<752) ;
  assign v_sync = ~(v_count>=490 && v_count<492) ;
  assign x_loc = h_count;
  assign y_loc = v_count;
  
endmodule