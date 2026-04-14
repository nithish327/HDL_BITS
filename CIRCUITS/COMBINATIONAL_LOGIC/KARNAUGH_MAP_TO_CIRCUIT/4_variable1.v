module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    always@(*)begin
        out = a | (c&~b);
        end

endmodule
