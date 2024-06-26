module Parking_test_4 ();

    reg clk;
    reg reset; // reset to start the day
    reg car_entered;
    reg is_uni_car_entered;
    reg car_exited;
    reg is_uni_car_exited;
    wire [8:0] uni_parked_car;
    wire [8:0] parked_car;
    wire [8:0] uni_vacated_space;
    wire [8:0] vacated_space;
    wire uni_is_vacated_space;
    wire is_vacated_space;
    wire illegal_enter;
    wire illegal_exit;

    Parking parking(
        clk,
        reset,
        car_entered,
        is_uni_car_entered,
        car_exited,
        is_uni_car_exited,
        uni_parked_car,
        parked_car,
        uni_vacated_space,
        vacated_space,
        uni_is_vacated_space,
        is_vacated_space,
        illegal_enter,
        illegal_exit
    );

    always begin
        clk = ~clk;
        #5;
    end

    integer i;

    initial begin
        clk = 0;
        reset = 1;
        car_entered = 0;
        car_exited = 0;
        is_uni_car_entered = 0;
        is_uni_car_exited = 0;
        
        #20;

        reset = 0;

        car_entered = 1;
        is_uni_car_entered = 1;

        #5120
        $display("10: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d\n",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        
        
        car_entered = 0;
        #15360;        // hour is now 16

        car_entered = 0;
        car_exited = 1;
        is_uni_car_exited = 1;
        #10
        $display("16: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        $display("free has vacancy: %d uni has vacancy: %d", is_vacated_space, uni_is_vacated_space);
        $display("illegal exit: %d illegal enter: %d\n", illegal_exit, illegal_enter);

        car_entered = 0;
        car_exited = 1;
        is_uni_car_exited = 0;
        #10
        $display("16: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        $display("free has vacancy: %d uni has vacancy: %d", is_vacated_space, uni_is_vacated_space);
        $display("illegal exit: %d illegal enter: %d\n", illegal_exit, illegal_enter);

        car_entered = 1;
        is_uni_car_entered = 0;
        car_exited = 0;
        is_uni_car_exited = 0;
        #10
        $display("16: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        $display("free has vacancy: %d uni has vacancy: %d", is_vacated_space, uni_is_vacated_space);
        $display("illegal exit: %d illegal enter: %d\n", illegal_exit, illegal_enter);

        car_entered = 1;
        is_uni_car_entered = 0;
        car_exited = 0;
        is_uni_car_exited = 0;
        #10
        $display("16: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        $display("free has vacancy: %d uni has vacancy: %d", is_vacated_space, uni_is_vacated_space);
        $display("illegal exit: %d illegal enter: %d\n", illegal_exit, illegal_enter);

        car_entered = 1;
        is_uni_car_entered = 1;
        car_exited = 0;
        is_uni_car_exited = 0;
        #10
        $display("16: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        $display("free has vacancy: %d uni has vacancy: %d", is_vacated_space, uni_is_vacated_space);
        $display("illegal exit: %d illegal enter: %d\n", illegal_exit, illegal_enter);

        car_entered = 0;
        is_uni_car_entered = 1;
        car_exited = 1;
        is_uni_car_exited = 1;
        #10
        $display("16: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        $display("free has vacancy: %d uni has vacancy: %d", is_vacated_space, uni_is_vacated_space);
        $display("illegal exit: %d illegal enter: %d\n", illegal_exit, illegal_enter);

        car_entered = 1;
        is_uni_car_entered = 1;
        car_exited = 1;
        is_uni_car_exited = 1;
        #10
        $display("16: free_parked: %d\n    uni_parked: %d\n    free_vacancy: %d\n    uni_vacancy: %d",
                        parked_car, uni_parked_car, vacated_space, uni_vacated_space);
        $display("free has vacancy: %d uni has vacancy: %d", is_vacated_space, uni_is_vacated_space);
        $display("illegal exit: %d illegal enter: %d\n", illegal_exit, illegal_enter);


        $stop();
    end


    
endmodule


