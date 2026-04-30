module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0]state,next_state;
    parameter [2:0] A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4,F=3'd5;
    always@(posedge clk)begin
        if(reset)
            state <= F;
        else
            state <= next_state;
    end
    always@(*)begin
        case(state)
            A :begin
                if(s==3'b111)
                    next_state = A;
                else if(s ==3'b011)
                    next_state = C;
                else
                    next_state = A;
            end
            B :begin
                if(s==3'b111)
                    next_state = A;
                else if(s ==3'b011)
                    next_state = B;
                else if(s==3'b001)
                    next_state = E;
                else
                    next_state = B;
            end
            C :begin
                if(s==3'b111)
                    next_state = A;
                else if(s ==3'b011)
                    next_state = C;
                else if(s==3'b001)
                    next_state = E;
                else
                    next_state = C;
            end
            D :begin
                if(s==3'b011)
                    next_state = B;
                else if(s ==3'b001)
                    next_state = D;
                else if(s==3'b000)
                    next_state = F;
                else
                    next_state = D;

            end
            E :begin
                if(s==3'b011)
                    next_state = B;
                else if(s ==3'b001)
                    next_state = E;
                else if(s==3'b000)
                    next_state = F;
                else
                    next_state = E;

            end
            F :begin
                if(s ==3'b000)
                    next_state = F;
                else if(s ==3'b001)
                    next_state = D;
                else
                    next_state = F;
            end
            default : next_state = F;
        endcase
    end
    assign {fr3,fr2,fr1,dfr} =
           (state==A) ? 4'b0000 :
           (state==B) ? 4'b0010 :
           (state==C) ? 4'b0011 :
           (state==D) ? 4'b0110 :
           (state==E) ? 4'b0111 :
           (state==F) ? 4'b1111 :
                        4'b1111;


endmodule
