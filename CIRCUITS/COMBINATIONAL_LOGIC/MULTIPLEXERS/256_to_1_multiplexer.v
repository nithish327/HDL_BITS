module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    wire [15:0]x;
    always @(*)begin
        out = in[sel];
    end
endmodule
