module T_FF(
    input T,
    input clk,
    input reset,
    input enable,
    output reg Q
    );
    always @ (posedge clk or posedge reset) begin
     if(reset==1'b1)begin
        Q = 1'b0; 
     end
     else begin
        if (T == 1'b1 & enable == 1'b1) begin
            Q = ~Q;
        end
        else begin
            Q = Q;
        end 
     end
    end 
endmodule