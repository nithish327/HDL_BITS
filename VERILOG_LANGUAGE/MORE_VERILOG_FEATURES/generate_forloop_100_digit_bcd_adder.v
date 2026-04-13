module top_module( input [399:0] a, b,input cin,output cout,output [399:0] sum );
    wire [99:0]cout_t;
    genvar i;
    bcd_fadd b0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(cout_t[0]),.sum(sum[3:0]));
    generate 
        for(i=1;i<100;i=i+1)begin:bcd
            bcd_fadd bi(.a(a[4*i+3:4*i]),.b(b[4*i+3:4*i]),.cin(cout_t[i-1]),.sum(sum[4*i+3:4*i]),.cout(cout_t[i]));                            
        end
    endgenerate
    assign cout=cout_t[99];
endmodule
