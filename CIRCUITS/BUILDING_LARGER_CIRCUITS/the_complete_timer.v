module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
    reg [3:0]state,next_state;
    reg [9:0]count1000;
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
            s8: next_state=(count==0 && count1000==999)?s9:s8;
            s9: next_state=(ack)?s0:s9;
        endcase
    end
    always @(posedge clk)begin
        if(reset)begin
            count<=0;
            count1000<=0;
        end
        else begin
            case(state)
                s4: count[3]<=data;
                s5: count[2]<=data;
                s6: count[1]<=data;
                s7: count[0]<=data;
                s8: begin
                    if(count1000<999)
                        count1000<=count1000+1;
                    else begin
                        count1000<=0;
                        if(count!=0)
                            count<=count-1;
                    end
                end
                default: count1000<=0;                                                        
            endcase
        end
    end
    assign counting=(state==s8);
    assign done=(state==s9);
endmodule
