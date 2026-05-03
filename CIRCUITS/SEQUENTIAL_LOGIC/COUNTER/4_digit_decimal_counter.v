module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    reg ena0;
    assign ena0 =1;
    assign ena[1]=(q[3:0]==9);
    assign ena[2]=(q[7:4]==9 && q[3:0]==9);
    assign ena[3]=(q[11:8]==9 && q[7:4]==9 && q[3:0]==9);
    decimal_counter d1(clk,reset,ena0,q[3:0]);
    decimal_counter d2(clk,reset,ena[1],q[7:4]);
    decimal_counter d3(clk,reset,ena[2],q[11:8]);
    decimal_counter d4(clk,reset,ena[3],q[15:12]);

endmodule
module decimal_counter(input clk,reset,enable,output reg [3:0]q);
    always@(posedge clk)begin
    if(reset ||(q==9 && enable))
        q<=0;
    else begin
        if(enable)
            q <= q+1;
        else
            q <= q;
    end
        
    end
endmodule
