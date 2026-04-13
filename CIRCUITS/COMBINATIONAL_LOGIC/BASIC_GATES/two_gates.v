module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire x;
    always @(*)begin
        x= ~(in1 ^ in2);
        out = x ^ in3;
    end

endmodule
