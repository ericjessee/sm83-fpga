module cpu_top_tb();

    reg clk;
    reg rst;

    wire[7:0] data_bus_tb;
    wire[15:0] addr_bus_tb;
    wire[15:0] decoded_addr_bus_tb;

    wire rom_oe_conn;
    wire rom_cs_conn;
    wire[7:0] rom_out;

    wire wram_oe_conn;
    wire wram_cs_conn;
    wire wram_wr_conn;
    wire[7:0] wram_out;

    //arbitrary constants
    wire const1;
    assign const1 = 1;
    wire const0;
    assign const0 = 0;

    //memory ip outputs are not tri state
    assign data_bus_tb = rom_oe_conn ? rom_out : 'hz;
    assign data_bus_tb = wram_oe_conn ? wram_out : 'hz;

    bootrom rom(
        .clka(clk),
        .ena(const1),
        .addra(decoded_addr_bus_tb),
        .douta(rom_out)
    ); 

    work_ram wram(
        .clka(clk),
        .rsta(const0),
        .ena(const1),
        .wea(const0), //TBD
        .addra(decoded_addr_bus_tb),
        .dina(data_bus_tb),
        .douta(wram_out)
    );

    address_decode addr_dec(
        .mem_oe(mem_oe_conn),
        .mem_cs(mem_cs_conn),
        .addr(addr_bus_tb),
        .decoded_addr(decoded_addr_bus_tb),
        .rom_oe(rom_oe_conn),
        .wram_oe(wram_oe_conn)
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