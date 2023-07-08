module address_decode(
    input mem_oe;
    input mem_cs;
    input[15:0] addr,
    output reg[15:0] decoded_addr,
    output rom_oe,
    output rom_cs,
    output wram_oe,
    output wram_cs

);

    //why do I even have cs and oe seperate?
    assign rom_oe = ((addr >= 16'h0000) && (addr <= 16'h00ff)) & mem_oe;
    assign wram_oe = ((addr >= 16'hc000) && (addr <= 16'hdfff)) & mem_oe;
    assign rom_cs = ((addr >= 16'h0000) && (addr <= 16'h00ff)) & mem_cs;
    assign wram_cs = ((addr >= 16'hc000) && (addr <= 16'hdfff)) & mem_cs;

    wire [1:0] range;
    assign range[0] = rom_oe;
    assign range[1] = wram_oe;

    localparam [1:0]
        in_range_bootrom = 2'h1, // (01)
        in_range_wram = 2'h2;    // (10)

    always @(*) begin
        case (range)
            in_range_bootrom: begin
                decoded_addr = addr;
            end
            in_range_wram: begin
                decoded_addr = addr - 16'hc000;
            end
        endcase 
    end
endmodule

