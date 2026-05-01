module top_module ();
    reg clk ;
    dut inst(.clk(clk));
    always #5 clk = ~clk;
    initial begin
        clk=0;
    end

endmodule
