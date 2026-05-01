module top_module ();
    reg clk,reset,t;
    wire q;
    tff dut (.clk(clk),.reset(reset),.t(t),.q(q));
    always #5 clk=~clk;
    initial begin
        reset = 1;
        clk =0;
        #10 reset =0;
        t = 0;#10;
        t = 1;#10;
        t = 0;#10;
        t = 1;#10;
        $finish;
    end
endmodule

