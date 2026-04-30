module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg [3:0] state,next_state;
    parameter A=0,B=1,C=2,D=3;

    // State transition logic
    always@(*)begin
        next_state[A] = (~in&state[A]) | (~in&state[C]);
        next_state[B] = (in&state[B]) | (in&state[A]) | (in&state[D]);
        next_state[C] = (~in&state[B]) | (~in&state[D]);
        next_state[D] = (in&state[C]);
    end

    // State flip-flops with asynchronous reset
    always@(posedge clk or posedge areset)begin
        if(areset)
            state <= 4'b0001;
        
        else
            state <= next_state;
    end
        

    // Output logic
    assign out = state[D];

endmodule
