module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter LEFT =0,RIGHT = 1,FALL_LEFT = 2,FALL_RIGHT =3;
    reg [1:0]state,next_state;
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
                else if(bump_left)
                    next_state = RIGHT;    
                else
                    next_state = LEFT;
            end
            RIGHT:begin
                if(!ground) 
                    next_state = FALL_RIGHT;
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
          
        endcase
    end
    assign walk_left = (state==LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = ((state==FALL_LEFT) || (state==FALL_RIGHT));
endmodule
