module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    always@(*)begin
        out_sop = c&(d|~a&~b);
        out_pos = ~a&c&~b | c&d;
    end

endmodule
