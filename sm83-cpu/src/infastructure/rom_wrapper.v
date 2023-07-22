module rom_wrapper(
    input clk,
    input en,
    input oe,
    input[15:0] addr,
    output[7:0] dout
);
    wire[7:0] rom_data;
    wire[15:0] addr_translate;

    //rom output is not tri state
    assign dout = oe ? rom_data : 'hz;
    
    bootrom rom(
        .clka(clk),
        .ena(en),
        .addra(addr),
        .douta(rom_data)
    );

endmodule