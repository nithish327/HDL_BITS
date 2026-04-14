module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    always@(*)begin
        out = ~b&~c | ~a&~d&(b|c) | c&d&(a|b);
    end

endmodule
