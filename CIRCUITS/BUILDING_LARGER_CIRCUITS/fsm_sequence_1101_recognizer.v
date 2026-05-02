module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter s0=0, s1=1, s2=2, s3=3, s4=4;
    reg [2:0] state, next_state;
    always @(posedge clk) begin
        if (reset)
            state <= s0;
        else
            state <= next_state;
    end
    always @(*) begin
        case(state)
            s0: next_state = data ? s1 : s0;
            s1: next_state = data ? s2 : s0;
            s2: next_state = data ? s2 : s3;
            s3: next_state = data ? s4 : s0;
            s4: next_state = s4;
            default: next_state = s0;
        endcase
    end
    assign start_shifting = (state == s4);

endmodule
