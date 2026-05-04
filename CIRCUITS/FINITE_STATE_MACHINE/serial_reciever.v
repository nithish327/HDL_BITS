module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
     localparam[2:0] idle=0,start=1,data=2,stop=3,donee=4,error=5;
    reg [2:0]state,next_state;
    reg [2:0]count;
    always @(posedge clk)begin
        if(reset) begin
            state<=idle;
            count<=0;
        end
        else begin
            state<=next_state;
            if(next_state==data)
                count<=count+1;
            else
                count<=0;
        end
    end
    always @(*) begin
        case(state)
            idle: begin
                if(in)
                    next_state=idle;
                else
                    next_state=start;
            end
            start: begin
                    next_state=data;
            end
            data: begin
                if(count==7)
                    next_state=stop;
                else
                    next_state=data;
            end
            stop: begin
                if(in)
                    next_state=donee;
                else
                    next_state=error;
            end
            donee: begin
                if(in)
                    next_state=idle;
                else
                    next_state=start;
            end
            error: begin
                if(in)
                    next_state=idle;
                else
                    next_state=error;
            end
            default: next_state=idle;
        endcase            
     end
     assign done=(state==donee);

endmodule
