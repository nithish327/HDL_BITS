module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    integer i;
    always@(posedge clk)begin
        if (reset)
            q <= 4'b0000;
        else if(q==4'd9)
            q <= 4'b0000;
        else
            q <= q+1;
    end
        
endmodule
