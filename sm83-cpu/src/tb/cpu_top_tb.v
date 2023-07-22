module cpu_top_tb();

    reg clk;
    reg rst;

    wire[7:0] data_bus_tb;
    wire[15:0] addr_bus_tb;

    wire mem_oe_conn;
    wire mem_cs_conn;
    wire[7:0] mem_out;

    wire wram_oe_conn;
    wire wram_cs_conn;
    wire wram_wr_conn;
    wire[7:0] wram_out;

    //arbitrary constants
    wire const1;
    assign const1 = 1;
    wire const0;
    assign const0 = 0;

    rom_wrapper bootrom(
        .clk(clk),
        .en(const1),
        .oe(mem_oe_conn),
        .addr(addr_bus_tb),
        .dout(data_bus_tb)
    );

    wram_wrapper wram(
        .clk(clk),
        .rst(rst),
        .en(const1),
        .we(const0),
        .oe(mem_oe_conn),
        .addr(addr_bus_tb),
        .din(data_bus_tb),
        .dout(data_bus_tb)
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