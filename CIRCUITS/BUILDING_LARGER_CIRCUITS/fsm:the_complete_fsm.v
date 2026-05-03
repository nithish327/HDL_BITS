module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
     parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
    reg [3:0]state,next_state;
    always @(posedge clk)begin
        if(reset)
            state<=0;
        else
            state<=next_state;
    end
    always @(*)begin
        case(state)
            s0: next_state=(data)?s1:s0;
            s1: next_state=(data)?s2:s0;
            s2: next_state=(data)?s2:s3;
            s3: next_state=(data)?s4:s0;
            s4: next_state=s5;
            s5: next_state=s6;
            s6: next_state=s7;
            s7: next_state=s8;
            s8: next_state=(done_counting)?s9:s8;
            s9: next_state=(ack)?s0:s9;
        endcase
    end
    assign shift_ena=(state==s4)|(state==s5)|(state==s6)|(state==s7);
    assign counting=(state==s8);
    assign done=(state==s9);
endmodule

