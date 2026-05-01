module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    reg [2:0]y1;
    always@(*)begin
        case({y,x})
            4'b0000:y1= 3'b000;
            4'b0001:y1= 3'b001;
            4'b0010:y1= 3'b001;
            4'b0011:y1= 3'b100;
            4'b0100:y1= 3'b010;
            4'b0101:y1= 3'b001;
            4'b0110:y1= 3'b001;
            4'b0111:y1= 3'b010;
            4'b1000:y1= 3'b011;
            4'b1001:y1= 3'b100;
        endcase
    end
    assign z =(y==3'b100 || y==3'b011 );
    assign Y0 = y1[0];


endmodule
