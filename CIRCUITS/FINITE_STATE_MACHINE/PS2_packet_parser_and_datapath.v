module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    reg [1:0]state ,next_state;
    parameter idle =0,byte1 =1,byte2=2;
    // FSM from fsm_ps2
    

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
        end
        else 
            state<= next_state;
           
    end 

    // New: Datapath to store incoming bytes.
    always@(posedge clk)begin
        if(reset)begin
            done <= 0;
            out_bytes <=24'd0;
        end
        else begin
            done <= 0;
            case (state)
                idle: begin
                    if (in[3])   
                        out_bytes[23:16] <= in;
                end
                byte1: begin
                    out_bytes[15:8] <= in;   
                end
                byte2: begin
                    out_bytes[7:0] <= in;    
                    done <= 1;             
                end
            endcase
        end
    end

endmodule
