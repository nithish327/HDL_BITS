module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    reg [511:0]q1;
    integer i;
    reg L,R,C;
    always @(posedge clk)begin
        if(load)
            q<=data;
        else
            q<=q1;
    end
    always @(*)begin
        for(i=0;i<512;i=i+1)begin
            L=(i==511)?1'b0:q[i+1];
            R=(i==0)?1'b0:q[i-1];
            C=q[i];
            q1[i]<=(~C&R)|(~L&C) |(~R&C);
        end
    end

endmodule
