module cpu_top_tb();

    reg clk;
    reg rst;

    wire[7:0] data_bus_tb;
    wire[15:0] addr_bus_tb;

    wire mem_oe_conn;
    wire mem_cs_conn;
    wire[7:0] mem_out;

    //arbitrary constants
    wire const1;
    assign const1 = 1;

    //rom output is not tri state
    assign data_bus_tb = mem_oe_conn ? mem_out : 'hz;

    bootrom rom(
        .clka(clk),
        .ena(const1),
        .addra(addr_bus_tb),
        .douta(mem_out)
    ); 

    cpu_top cpu(
        .clk(clk),
        .rst(rst),
        .mem_oe(mem_oe_conn),
        .mem_cs(mem_cs_conn),
        .data_bus_ext(data_bus_tb),
        .addr_bus_ext(addr_bus_tb)
    );

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
            clk=~clk;
        end       
    end

endmodule