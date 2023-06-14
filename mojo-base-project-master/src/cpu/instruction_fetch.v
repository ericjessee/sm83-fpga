module instruction_fetch (
    input clk,
    input rst,

    inout[7:0] data_bus,
    input[16:0] addr_bus
    


    input go,
    output reg done,
    output reg ready
);

    reg[7:0] opcode;

    internal_param [7:0]
        //opcodes

    reg[7:0] current_state, next_state;

    always @(posedge clk) begin
        if(rst) begin
            current_state <= reset;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(current_state) begin
        next_state = current_state;
        case(current_state)
            idle: begin
                ready <= 1;
                done <= 0;
                if (go)
                    next_state <= start;
                else
                    next_state <= current_state;
            end
            start: begin //read the instruction from memory
                done <= 0; 
                ready <= 0;
                opcode <= data_bus;
                next_state <= decode;
            end
            decode: begin
                case (opcode)

                endcase
            end
        endcase
    end

endmodule