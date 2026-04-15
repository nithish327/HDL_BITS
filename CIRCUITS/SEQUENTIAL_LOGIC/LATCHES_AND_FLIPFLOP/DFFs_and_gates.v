module top_module (
    input clk,
    input x,
    output z
); 
    wire q1,q2,q3;
    always@(posedge clk)begin
        if(clk)
            q1 <= x^q1;
        else
            q1 <= 0;
    end
    always@(posedge clk)begin
        if(clk)
            q2 <= x&~q2;
        else
            q2 <= 0;
    end
    always@(posedge clk)begin
        if (clk)
            q3 <= x |~q3;
        else
            q3 <= 0;
    end
    assign z = ~(q1|q2|q3);

endmodule
