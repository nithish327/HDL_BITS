module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );
    always @(posedge clk )begin
        if(clk)
            q=d;
        else
            q=0;
    end
endmodule
