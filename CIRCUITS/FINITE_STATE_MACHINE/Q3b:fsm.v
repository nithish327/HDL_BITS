module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter[2:0] A= 3'b000,B= 3'b001,C= 3'b010,D= 3'b011,E= 3'b100;
    reg [2:0]state,next_state;
    always@(posedge clk)begin
        if(reset)
            state<=3'b000;
        else
            state<=next_state;
    end
    always@(*)begin
        case(state)
            A:next_state = x?B:A;
            B:next_state = x?E:B;
            C:next_state = x?B:C;
            D:next_state = x?C:B;
            E:next_state = x?E:D;
            default:next_state = 3'b000;
        endcase
    end
    assign z =(state==D | state==E);

endmodule
