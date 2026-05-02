module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    always@(*)begin
        Y1 = y[0]&w;
        Y3= y[1]&~w | y[2]&~w | y[4]&~w | y[5]&~w;
    end
     
endmodule
