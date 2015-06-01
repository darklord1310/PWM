library verilog;
use verilog.vl_types.all;
entity PWM is
    generic(
        start           : integer := 0;
        toggle          : integer := 1;
        resetCounter    : integer := 2
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        PWM_out         : out    vl_logic
    );
end PWM;
