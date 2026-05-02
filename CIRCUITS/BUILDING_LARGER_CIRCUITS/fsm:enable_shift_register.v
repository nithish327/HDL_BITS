module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    parameter s0=0, s1=1, s2=2, s3=3, s4=4;
    reg [2:0] state, next_state;
    always @(posedge clk) begin
            state <= next_state;
    end
    always @(*) begin
        case(state)
            s0: next_state = reset?s1:s0;
            s1: next_state = s2 ;
            s2: next_state = s3;
            s3: next_state = s4;
            s4: next_state = s0;
        endcase
    end
    assign shift_ena=(state==s1 | state==s2 | state==s3 | state==s4);
endmodule

