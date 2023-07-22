module wram_wrapper(
    input clk,
    input rst,
    input en,
    input we,
    input oe,
    input[15:0] addr,
    input[7:0] din,
    output[7:0] dout
);

    wire in_range;
    assign in_range = (addr >= 'hc000) & (addr <= 'hdfff);

    wire[7:0] wram_dout;
    assign dout = (oe & in_range) ? wram_dout : 'hz;


    wire[15:0] addr_translate;
    assign addr_translate = addr & (16'h3fff);

    wram work_ram(
        .clka(clk),
        .rsta(rst),
        .ena(en),
        .wea(we),
        .addra(addr_translate),
        .dina(din),
        .douta(wram_dout)
    );

endmodule