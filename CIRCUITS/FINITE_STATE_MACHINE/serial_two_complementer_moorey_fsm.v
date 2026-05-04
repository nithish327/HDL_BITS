module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter a=0,b=1,c=2,d=3;
    reg[1:0]state,next_state;
    always@(posedge clk or posedge areset)begin
        if(areset)
            state <= 0;
        else
            state <= next_state;
    end
    always@(*)begin
        case(state)
            a : next_state = x?b:a;
            b : next_state = x?d:c;
            c : next_state = x?d:c;
            d : next_state = x?d:c;
        endcase
    end
    
    always @(*) begin
        case(state)
            a: z = 0;
            b: z = 1;
            c: z = 1;
            d: z = 0;
            default: z = 0;
        endcase
    end
endmodule
