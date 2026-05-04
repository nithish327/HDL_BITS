module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
        always @(posedge clk) begin
        if(reset) begin
            hh<=8'h12;
            mm<=8'h00;
            ss<=8'h00;
            pm<=0;
        end
        else if(ena)begin
            //Seconds Logic
            if(ss==8'h59)
                ss<=0;
            else if(ss[3:0]==9)begin
                ss[3:0]<=0;
                ss[7:4]<=ss[7:4]+1;
            end
            else
                ss[3:0]<=ss[3:0]+1;
            //Minutes Logic
            if(ss==8'h59)begin
                if(mm==8'h59)
                    mm<=0;
                else if(mm[3:0]==9)begin
                    mm[3:0]<=0;
                    mm[7:4]<=mm[7:4]+1;
                end
                else
                    mm[3:0]<=mm[3:0]+1;
            end
            //Hours Logic
            if(ss==8'h59 && mm==8'h59)begin
                if(hh==8'h11)begin
                    hh<=8'h12;
                    pm<=~pm;
                end
                else if(hh==8'h12)
                    hh<=8'h01;
                else if(hh[3:0]==9) begin
                    hh[3:0]<=0;
                    hh[7:4]<=hh[7:4]+1;
                end
                else
                    hh[3:0]<=hh[3:0]+1;
            end
        end                                                                                                
    end

endmodule
