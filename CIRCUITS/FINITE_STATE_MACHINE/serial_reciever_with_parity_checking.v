module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
     localparam IDLE=0, DATA=1, PARITY=2, STOP=3, WAIT=4;
    reg [2:0] state, next;
    reg [2:0] count;      
    reg [7:0] data;
    wire odd;             
    reg parity_reset;
    parity p0 (.clk(clk),.reset(parity_reset),.in(in),.odd(odd));
    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next;
    end
    always @(*) begin
        next = state;
        case(state)
            IDLE:   next = (in == 0) ? DATA : IDLE;
            DATA:   next = (count == 3'd7) ? PARITY : DATA;
            PARITY: next = STOP;
            STOP:   next = (in == 1) ? IDLE : WAIT;
            WAIT:   next = (in == 1) ? IDLE : WAIT;
        endcase
    end
    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            data <= 0;
            done <= 0;
        end else begin
            done <= 0; 
            case(state)
                IDLE: begin
                    count <= 0;
                end

                DATA: begin
                    data <= {in, data[7:1]};  // LSB first
                    count <= count + 1;
                end
                STOP: begin
                    // check BOTH stop bit and parity
                    if (in == 1 && odd == 1) begin
                        out_byte <= data;
                        done <= 1;
                    end
                end
            endcase
        end
    end
    always @(*) begin
        parity_reset = (state == IDLE);
    end
endmodule
