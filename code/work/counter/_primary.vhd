library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        hour            : out    vl_logic_vector(4 downto 0)
    );
end counter;
