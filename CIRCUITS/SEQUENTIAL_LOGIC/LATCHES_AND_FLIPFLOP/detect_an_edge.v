module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]prev_in;
    integer i;
    always@(posedge clk)begin
        for (i =0; i<8;i++)begin
            if(prev_in[i] ==0 && in[i]==1)
                pedge[i] <= 1;
            else
                pedge[i] <= 0;
        end
        prev_in<=in;

    end
endmodule
