module Parking(
    input clk,
    input reset, // reset to start the day
    input car_entered,
    input is_uni_car_entered,
    input car_exited,
    input is_uni_car_exited,
    output reg [8:0] uni_parked_car,
    output reg [8:0] parked_car,
    output reg [8:0] uni_vacated_space,
    output reg [8:0] vacated_space,
    output reg uni_is_vacated_space,
    output reg is_vacated_space,
    output reg illegal_enter,
    output reg illegal_exit
);
    wire [4:0] hour;  // hour = real hour - 8
    reg [8:0] limit_uni, limit_reg;

    reg [12:0] real_time;
    assign hour = real_time [12:8]; // each hour is 256 clocks

    always @(posedge clk or reset)begin
        if(reset == 1)begin
            real_time = 0;
        end
        else begin
            real_time = real_time + 1;
        end
    end

    always @(hour)begin
        if(hour == 0)begin // at 8
            limit_uni = 500;
            limit_reg = 200;
        end
        if(hour == 5)begin // at 13
            limit_uni = 450;
            limit_reg = 250;
        end
        if(hour == 6)begin // at 14
            limit_uni = 400;
            limit_reg = 300;
        end
        if(hour == 7)begin // at 15
            limit_uni = 350;
            limit_reg = 350;
        end
        if(hour == 8)begin // at 16
            limit_uni = 200;
            limit_reg = 500;
        end
    end

    always @(posedge clk)begin
        illegal_enter = 0;
        illegal_exit = 0;
        uni_is_vacated_space = 1;
        is_vacated_space = 1;

        if(uni_parked_car > limit_uni)begin
            parked_car = parked_car + uni_parked_car - limit_uni;
            vacated_space = limit_reg - parked_car;
            uni_parked_car = limit_uni;
            uni_is_vacated_space = 0;
        end

        if(reset == 1)begin
            uni_parked_car = 0;
            parked_car = 0;
            uni_vacated_space = 500;
            vacated_space = 200;
        end

        if(car_exited)begin
            if(is_uni_car_exited == 1)begin
                if (0 < uni_parked_car)begin
                    uni_parked_car = uni_parked_car - 1;
                    uni_vacated_space = uni_vacated_space + 1;
                end
                else illegal_exit = 1;
            end
            if(is_uni_car_exited == 0)begin
                if( parked_car > 0)begin
                    parked_car = parked_car - 1;
                    vacated_space = vacated_space + 1;
                end
                else illegal_exit = 1;
            end
        end

        if(car_entered)begin
            if(is_uni_car_entered == 1)begin
                if (limit_uni > uni_parked_car)begin
                    uni_parked_car = uni_parked_car + 1;
                    uni_vacated_space = uni_vacated_space - 1;
                end
                else if(limit_reg > parked_car)begin
                    parked_car = parked_car + 1;
                    vacated_space = vacated_space - 1;
                end
                else illegal_enter = 1;
            end
            if(is_uni_car_entered == 0)begin
                if( limit_reg > parked_car )begin
                    parked_car = parked_car + 1;
                    vacated_space = vacated_space - 1;
                end
                else illegal_enter = 1;
            end
        end

        if (uni_parked_car >= limit_uni) uni_is_vacated_space = 0;
        if (parked_car >= limit_reg) is_vacated_space = 0;
    end
endmodule
