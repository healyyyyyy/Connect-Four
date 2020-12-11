module v_Counter(clk,v_enable,v_count);
  input clk;
  input v_enable;
  output [9:0] v_count;
  reg [9:0] v_count;
  initial 
    begin
      v_count=0;
    end
  always @ (posedge clk)
    begin 
      if (v_enable == 1) 
        begin
          if (v_count<524)
            begin
              v_count<=v_count+1;
            end
          else
            begin
              v_count<=0;
            end
        end
    end
endmodule