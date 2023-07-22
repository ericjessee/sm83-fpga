module rom_wrapper(
    input clk,
    input en,
    input oe,
    input[15:0] addr,
    output[7:0] dout
);
    wire[7:0] rom_data;

    wire in_range;
    assign in_range = (addr >= 'h0) & (addr <= 'hff);
    
    //rom output is not tri state
    assign dout = (oe & in_range) ? rom_data : 'hz;
    
    bootrom rom(
        .clka(clk),
        .ena(en),
        .addra(addr),
        .douta(rom_data)
    );

endmodule