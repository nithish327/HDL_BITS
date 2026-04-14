module top_module( 
    input a, b, sel,
    output out ); 
    always@(*)begin
        out = (sel==0) ? a:b;
    end
endmodule
