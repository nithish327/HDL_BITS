module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
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
            a:next_state = w ?b:a;
            b:next_state = w ?c:d;
            c:next_state = w ?e:d;
            d:next_state = w ?f:a;
            e:next_state = w ?e:d;
            f:next_state = w ?c:d;
            default:next_state = a;
        endcase 
    end
    assign z =(state==e || state==f);

endmodule
