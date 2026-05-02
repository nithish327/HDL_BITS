module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    parameter [2:0]a=0,b=1,c=2,d=3,e=4,f=5;
    reg [2:0]state,next_state;
    always@(posedge clk )begin
        if(reset)
            state <= a;
        else
            state <= next_state;
    end
    always@(*)begin
        case(state)
            a:next_state = w ?a:b;
            b:next_state = w ?d:c;
            c:next_state = w ?d:e;
            d:next_state = w ?a:f;
            e:next_state = w ?d:e;
            f:next_state = w ?d:c;
            default:next_state = a;
        endcase 
    end
    assign z =(state==e || state==f);

endmodule
