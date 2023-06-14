module incrementer(
    input clk,
    input en,
    input[15:0] din,
    output [15:0] dout
);

reg[15:0] scratch;

assign dout = en ? scratch : 'hz;

always @(posedge clk) begin
    scratch <= din + 1;
end

endmodule