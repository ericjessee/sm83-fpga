module mem_tb();

    reg clk;
    reg en;
    reg rst;
    reg[31:0] addr;
    wire[31:0] data;

    mem rom (
        .clka(clk),
        //.ena(en),
        //.rsta(rst),
        .addra(addr),
        .douta(data)
    );

    initial begin
        addr=0;
        forever begin
			#100
            clk=1;
            #100
            clk=0;
            addr=addr+4;
        end
    end

endmodule