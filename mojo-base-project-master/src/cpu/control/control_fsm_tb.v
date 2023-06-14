module control_fsm_tb();

    reg clk;
    reg rst;

    control ctl_test(clk, rst);

    initial begin
        clk=0;
        rst=1;
        #10
        clk=1;
        #10
        clk=0;
        rst=0;
        forever begin
            #10
            clk=1;
            #10
            clk=0;
        end
    end

endmodule