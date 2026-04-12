module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0]sum1,sum2;
    wire cout1,cout2;
    wire [31:0] x_or_b;
    assign x_or_b=sub?~b:b; 
    add16 a1(.a(a[15:0]),.b(x_or_b[15:0]),.cin(sub),.sum(sum1),.cout(cout1));
    add16 a2(.a(a[31:16]),.b(x_or_b[31:16]),.cin(cout1),.sum(sum2),.cout(cout2));
    assign sum ={sum2,sum1};


endmodule
