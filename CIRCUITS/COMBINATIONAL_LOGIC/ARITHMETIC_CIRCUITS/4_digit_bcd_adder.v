module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0]cout_t;
    bcd_fadd a0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(cout_t[0]));
    genvar i;
    generate
        for(i=1; i<4; i++)begin:bcd
            bcd_fadd ai(.a(a[i*4 +3:i*4]),.b(b[i*4 +3:i*4]),.cin(cout_t[i-1]),.sum(sum[i*4 +3:i*4]),.cout(cout_t[i]));
        end
    endgenerate
        assign cout = cout_t[3];

endmodule
