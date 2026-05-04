module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg state,next_state;
    parameter a=0,b=1;
    always@(posedge clk or posedge areset)begin
        if(areset)
            state <= 0;
        else
            state <= next_state;
    end
    always@(*)begin
        case(state)
            a: next_state = x?b:a;
            b: next_state = x?b:b;
        endcase
    end
    always@(*)begin
        z = (state == a & x) | (state ==b & ~x);
    end
endmodule
