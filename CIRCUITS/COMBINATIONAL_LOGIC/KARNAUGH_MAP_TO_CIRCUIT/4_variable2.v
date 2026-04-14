module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    always @(*)begin
        out = ~c&~d&(a^b) | c&d&(a^b) | c&~d&~(a^b) |~c&d &~(a^b);
    end

endmodule
