module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]prev_in;
    always @(posedge clk )begin
        if(reset)begin
            out<=0;
        	prev_in<=0;
        end
        else begin
            out <= out | (prev_in & ~in);         
        end
        prev_in<=in;
    end
    
endmodule
