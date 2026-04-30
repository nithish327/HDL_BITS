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
    
    parameter LEFT =0,RIGHT = 1,FALL_LEFT = 2,FALL_RIGHT =3,LEFT_DIG=4,RIGHT_DIG=5;
    reg [2:0]state,next_state;
    always@(posedge clk or posedge areset)begin
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end
    always@(*)begin
        case(state)
            LEFT:begin
                if(!ground) 
                    next_state = FALL_LEFT;
                else if(ground && dig)
                    next_state = LEFT_DIG;
                else if(bump_left)
                    next_state = RIGHT;    
                else
                    next_state = LEFT;
            end
            RIGHT:begin
                if(!ground) 
                    next_state = FALL_RIGHT;
                else if(ground && dig)
                    next_state = RIGHT_DIG;
                else if(bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            FALL_LEFT:begin
                if(!ground) 
                    next_state = FALL_LEFT;
                else
                    next_state = LEFT;
            end
            FALL_RIGHT:begin
                if(!ground) 
                    next_state = FALL_RIGHT;
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

        endcase
    end
    assign walk_left = (state==LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state==FALL_LEFT) || (state==FALL_RIGHT);
    assign digging = (state==LEFT_DIG) || (state==RIGHT_DIG);

endmodule
