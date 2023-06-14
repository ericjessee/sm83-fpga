module reg_tb();

    wire[7:0] data_bus;
	reg[7:0] assert_data;
	reg data_present;
    reg wr;
    reg rst;
    reg clk;
    reg oe;
	 
	register #(8) tst_reg(
		.data(data_bus),
        .wr(wr),
        .rst(rst),
        .clk(clk),
        .oe(oe)
	);
	
	assign data_bus = data_present ? assert_data : 'hz;

    initial begin
    assert_data = 0;
    wr=0;
    rst=0;
    clk=0;
    oe=0;
    #10
    assert_data = 8'hfc;
	data_present = 1;
    wr=1;
    #10
    clk=1;
    #10
    clk=0;
    #10
    wr=0;
    data_present=0;
	clk=1;
	#10
	clk=0;
	oe=1;
	#10
	clk=1;
	#10
	clk=0;
    end

endmodule