module addr_buffer(
    inout[15:0] addr_bus_int,
    inout[15:0] addr_bus_ext,
    input latch,
    input oe,
    input bypass
);

    reg [15:0] addr_bus_scratch;

    assign addr_bus_ext = (oe & !bypass) ? addr_bus_scratch : 'hz;

    assign addr_bus_ext = bypass ? addr_bus_int : 'hz;

    always @(posedge latch) begin
        addr_bus_scratch <= addr_bus_int;
    end

endmodule