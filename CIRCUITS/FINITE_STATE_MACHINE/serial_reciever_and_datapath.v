module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    localparam idle=0,data=1,waiting=2;
    reg [7:0] bytes;
    reg [1:0] state,next;
    reg [3:0] count;
    always@(posedge clk)begin 
        if(reset)begin
            state<=idle;
            done<=0;
            count<=0;
            bytes<=0;
        end
        else begin
            state<=next;
            done<=(state==data && next==idle) ;
            if(state==idle)
                bytes<=0;
            if(state==data && count < 8)begin
                bytes<={in,bytes[7:1]};
                count<=count+1;
                end
            else 
                count<=0;
        end
    end
    
    always@(*)begin
      next=state;
        case(state)
            idle:
                begin 
                    next=(!in)?data:idle;
                end
            data:
                begin
                    if(count<8)
                        next=data;
                    else
                        next=in?idle:waiting;
                end
            waiting:next=in?idle:waiting;
            default:next=idle;
        endcase
    end

assign out_byte=done?bytes:8'b0;

endmodule
