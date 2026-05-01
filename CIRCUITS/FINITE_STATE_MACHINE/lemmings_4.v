module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT =0,RIGHT = 1,FALL_LEFT = 2,FALL_RIGHT =3,LEFT_DIG=4,RIGHT_DIG=5,SPLAT=6;
    reg [2:0]state,next_state;
    reg [4:0]fall_count;
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state <= LEFT;
            fall_count <= 0;
        end
        else begin
            state <= next_state;
            if(state==FALL_LEFT || state==FALL_RIGHT)
                fall_count <= (fall_count<20)?fall_count + 5'd1:fall_count;
            else if(state==LEFT || state==RIGHT)
                fall_count <= 0;
            else
                fall_count <= fall_count;
        end
    end
    always@(*)begin
        next_state = state;
        case(state)
            LEFT:begin
                if(!ground) 
                    next_state = FALL_LEFT;
                else if(dig)
                    next_state = LEFT_DIG;
                else if(bump_left)
                    next_state = RIGHT;    
                else
                    next_state = LEFT;
            end
            RIGHT:begin
                if(!ground) 
                    next_state = FALL_RIGHT;
                else if(dig)
                    next_state = RIGHT_DIG;
                else if(bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            FALL_LEFT:begin
                if(!ground) 
                    next_state = FALL_LEFT;
                else if(fall_count >= 5'd20)
                    next_state = SPLAT;
                else
                    next_state = LEFT;
            end
            FALL_RIGHT:begin
                if(!ground) 
                    next_state = FALL_RIGHT;
                else if(fall_count >= 5'd20)
                    next_state = SPLAT;
                else
                    next_state = RIGHT;
            end
            LEFT_DIG:begin
                if(ground)
                    next_state = LEFT_DIG;
                else
                    next_state = FALL_LEFT;
            end
            RIGHT_DIG:begin
                if(ground)
                    next_state = RIGHT_DIG;
                else
                    next_state = FALL_RIGHT;
            end
            SPLAT: begin
                next_state = SPLAT;
            end
            
        endcase
    end
    assign walk_left = (state==LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state==FALL_LEFT) || (state==FALL_RIGHT);
    assign digging = (state==LEFT_DIG) || (state==RIGHT_DIG);

endmodule
