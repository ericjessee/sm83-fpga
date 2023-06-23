module timer_tb();

    reg clk;
    reg rst;
    wire out;

    timer tst_timer(
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    initial begin
        rst=1;
        clk=0;
        #10
        clk=1;
        #10
        clk=0;
        #10
        clk=1;
        rst=0;
        forever begin
            #10 clk = ~clk;
        end
    end
endmodule