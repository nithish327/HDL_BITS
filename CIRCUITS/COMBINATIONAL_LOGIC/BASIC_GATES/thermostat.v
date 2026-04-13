module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always@(*)begin
        heater = (mode & too_cold & ~aircon);
        aircon = (~mode & too_hot & ~heater);
        fan = (fan_on | heater | aircon);
    end

endmodule
