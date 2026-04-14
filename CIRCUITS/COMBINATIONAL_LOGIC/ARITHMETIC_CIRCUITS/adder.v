module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire z;
    wire [2:0]cout;
    full_adder a1(.x(x[0]),.y(y[0]),.z(0),.sum(sum[0]),.cout(cout[0]));
    full_adder a2(.x(x[1]),.y(y[1]),.z(cout[0]),.sum(sum[1]),.cout(cout[1]));
    full_adder a3(.x(x[2]),.y(y[2]),.z(cout[1]),.sum(sum[2]),.cout(cout[2]));
    full_adder a4(.x(x[3]),.y(y[3]),.z(cout[2]),.sum(sum[3]),.cout(sum[4]));

endmodule
module full_adder(input x,y,z,output sum,output cout);
    always @(*)begin
        sum = x^y^z;
        cout = x&y | y&z | x&z;
    end 
endmodule
