module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    genvar i ;
    generate 
        for(i=0; i<8; i++)begin:flip_flop
            d_ff(.clk(clk),.d(d[i]),.q(q[i]));
        end
    endgenerate

endmodule
module d_ff(input clk,input d,output q);
    always@(posedge clk)begin
        if (clk)
            q=d;
        else
            q=~d;
    end
endmodule
