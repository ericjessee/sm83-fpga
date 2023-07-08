module address_decode_tb();

reg[15:0] addr_in;
wire[15:0] addr_out;
wire rom_oe_conn;
wire wram_oe_conn;

address_decode dcd(
    .addr(addr_in),
    .decoded_addr(addr_out),
    .rom_oe(rom_oe_conn),
    .wram_oe(wram_oe_conn)
);

    initial begin
    #10
    addr_in <= 1;
    #10
    addr_in <= 16'hc004;
    end

endmodule
