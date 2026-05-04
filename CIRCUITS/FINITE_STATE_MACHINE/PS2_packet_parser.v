module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    reg [1:0]state ,next_state;
    parameter idle =0,byte1 =1,byte2=2;
    

    // State transition logic (combinational)
    always@(*)begin
        next_state = state;
        case(state)
            idle : next_state = in[3]?byte1:idle;
            byte1: next_state = byte2;
            byte2: next_state = idle;
        endcase
    end
 
    // State flip-flops (sequential)
    always@(posedge clk)begin
        if(reset) begin
            state<=idle;
            done <= 0;
        end
        else begin
            state<= next_state;
            done <= (state==byte2);
        end
    end 

endmodule
