module wram_wrapper(
    .clk
    .rst
    .en
    .we
    .addrin
    .addrout    
);

//UNFINISHED

    wram work_ram(
        .clka(clk),
        .rsta(const0),
        .ena(const1),
        .wea(wram_wr_conn),
        .addra(ar),
        .dina(),
        .douta()
    );

endmodule