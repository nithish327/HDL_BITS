module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    generate 
        for(i =0; i<100; i = i+1)begin:adder
            if(i==0)
                full_adder a1(.a(a[i]),.b(b[i]),.cin(cin),.sum(sum[i]),.cout(cout[i]));
            else
                full_adder a1(.a(a[i]),.b(b[i]),.cin(cout[i-1]),.sum(sum[i]),.cout(cout[i]));
            end 
    endgenerate 
endmodule
    module full_adder (input a,b,cin,output sum,cout);
    always @(*)begin
        sum = a^b^cin;
        cout = a&b | b&cin | a&cin;
    end
    
endmodule
