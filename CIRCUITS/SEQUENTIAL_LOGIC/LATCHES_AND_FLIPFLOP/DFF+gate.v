module top_module (
    input clk,
    input in, 
    output out);
    wire d;
    always @(*)begin
        d = in ^ out;
    end
    always @(posedge clk)begin
        if(clk)
            out <= d;
        else
            out <= ~d;
    end
        

endmodule
