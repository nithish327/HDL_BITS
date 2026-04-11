module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
   wire cout1,cout2,cout3,cin;
    wire [15:0]sum1,sum2,sum3,mux_sum;
    add16 a0(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum1),.cout(cout1));
    add16 a1(.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(sum2),.cout(cout2));
    add16 a2(.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(sum3),.cout(cout3));
    always @(*) begin
        case (cout1)
            0:mux_sum=sum2;
            1:mux_sum=sum3;
        endcase
    end
    assign sum={mux_sum,sum1};
endmodule
