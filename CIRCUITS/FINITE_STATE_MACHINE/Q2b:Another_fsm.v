module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A=0,B=1,C=2,D=3,E=4,Cycle1=5,Cycle2=6,F=7,G=8;
    reg [3:0]state,next_state;
    always @(posedge clk)begin
        if(!resetn)
            state<=A;
        else
            state<=next_state;
    end
    always @(*)begin
        case(state)
            A: next_state= B;
            B: next_state= C;
            C: next_state= (x)?D:C;
            D: next_state= (x)?D:E;
            E: next_state= (x)?Cycle1:C;
            Cycle1: next_state= (y)?F:Cycle2;
            Cycle2: next_state= (y)?F:G;
            F: next_state= F;
            G: next_state= G;
            default: next_state=A;
        endcase
    end
    assign f=(state==B);
    assign g=(state==F || state==Cycle1 || state==Cycle2);  

endmodule
