library verilog;
use verilog.vl_types.all;
entity Parking is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        car_entered     : in     vl_logic;
        is_uni_car_entered: in     vl_logic;
        car_exited      : in     vl_logic;
        is_uni_car_exited: in     vl_logic;
        uni_parked_car  : out    vl_logic_vector(8 downto 0);
        parked_car      : out    vl_logic_vector(8 downto 0);
        uni_vacated_space: out    vl_logic_vector(8 downto 0);
        vacated_space   : out    vl_logic_vector(8 downto 0);
        uni_is_vacated_space: out    vl_logic;
        is_vacated_space: out    vl_logic;
        illegal_enter   : out    vl_logic;
        illegal_exit    : out    vl_logic
    );
end Parking;
