//simple counter timer to stretch my legs

module timer(
    input clk,
	input rst,
    output reg out
    );
	 
reg[23:0] counter;

always @(posedge clk) begin
    if (rst) begin
        out <= 0;
        counter <= 0;
    end    
    else begin
        if (counter == 24'hffffff) begin
        counter <= 0;
        out <= ~out;
        end
        else begin
        counter <= counter + 1;
        end
    end
end

endmodule