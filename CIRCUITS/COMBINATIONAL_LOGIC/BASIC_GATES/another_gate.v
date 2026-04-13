module top_module (
    input in1,
    input in2,
    output out);
    wire x;
    always@(*)begin
        x = ~(in2);
        out = in1& x;
    end

endmodule
