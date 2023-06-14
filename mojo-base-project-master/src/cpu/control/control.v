//FSM infastructure roughly based on https://verilogguide.readthedocs.io/en/latest/verilog/fsm.html

module control(
    input clk,
    input rst,

    inout[15:0] addr_bus,
	 input[7:0] data_bus,

    output reg pc_oe,
    output reg pc_wr,
    output reg pc_ldh,
    output reg pc_ld16,
    output reg pc_inc_en,
    output reg pc_inc_tap_en,

    output reg a_wr,
    output reg a_oe,

    output reg mem_cs,
    output reg mem_oe
);

    reg[7:0] opcode;
    reg[15:0] addr_scratch;
    reg[7:0] scratch;
    reg[15:0] current_state, next_state, return_state;
    reg assert_addr;
    reg[3:0] ld_reg;

    localparam[3:0]
        //register enums
        reg_a = 4'h0,
        reg_f = 4'h1,
        reg_b = 4'h2,
        reg_c = 4'h3,
        reg_d = 4'h4,
        reg_e = 4'h5,
        reg_h = 4'h6,
        reg_l = 4'h7;

    wire[15:0] reset_vec;

    assign addr_bus = assert_addr ? addr_scratch : 'hz;
    assign reset_vec = 16'h0000;

    localparam[15:0]
        //control operations
		reset = 16'hff00,
        reset_pc_a = 16'hff01,
        reset_pc_b = 16'hff02,
        inc_pc_a = 16'hff03,
        inc_pc_b = 16'hff04,
        fetch_a = 16'hff05,
        fetch_b = 16'hff06,
	    fetch_c = 16'hff07,
        decode_a = 16'hff08,
        load_byte_a = 16'hff09,
        load_byte_b = 16'hff0a,
        load_byte_c = 16'hff0b;

    localparam[7:0]
        //opcodes--------------|
        //8 bit immediate loads
        ldc_d8 = 8'h0e,
        lde_d8 = 8'h1e,
        ldl_d8 = 8'h2e,
        lda_d8 = 8'h3e,
        ldb_d8 = 8'h06,
        ldd_d8 = 8'h16,
        ldh_d8 = 8'h26;



    always @(posedge clk, posedge rst) begin
        if(rst) begin
            current_state <= reset;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(current_state) begin
    next_state = current_state; //when no case is satisfied, remain on current state
    case(current_state)
        reset: begin
            mem_cs <= 1;
            mem_oe <= 0;
            a_oe <= 0;
            a_wr <= 0;
            pc_oe <= 0;
            pc_wr <= 0;
            pc_ldh <= 0;
            pc_ld16 <= 0;
            pc_inc_en <= 0;
            pc_inc_tap_en <= 0;
            assert_addr <= 0;
            next_state <= reset_pc_a;
        end
        reset_pc_a: begin
            addr_scratch <= reset_vec;
            assert_addr <= 1;
            pc_wr <= 1;
            next_state <= reset_pc_b;
        end
        reset_pc_b: begin
            pc_wr <= 0;
            assert_addr <= 0;
            next_state <= fetch_a;
        end
        inc_pc_a: begin
            mem_oe <= 0;
            pc_oe <= 1;
            pc_inc_tap_en <= 1;
            next_state <= inc_pc_b;
        end
        inc_pc_b: begin
            pc_inc_tap_en <= 0;
            pc_inc_en <= 1;
            pc_oe <= 0;
            pc_wr <= 1;
            next_state <= return_state;
        end
        fetch_a: begin
            a_oe <= 0;
            a_wr <= 0;
            mem_oe <= 0;
            pc_oe <= 1;
            pc_wr <= 0;
            pc_ldh <= 0;
            pc_ld16 <= 0;
            pc_inc_en <= 0;
            pc_inc_tap_en <= 0;
            assert_addr <= 0;
            next_state <= fetch_b;
        end
        fetch_b: begin
            mem_oe <= 1;
            next_state <= fetch_c;
        end
        fetch_c: begin
            opcode <= data_bus;
            next_state <= decode_a;
        end
        decode_a: begin
            case(opcode)
                lda_d8: begin
                    ld_reg <= reg_a;
                    return_state <= load_byte_a;
                    //increment pc to access the following byte
                    next_state <= inc_pc_a;
                end
                default: begin
                    return_state <= fetch_a;
                    next_state <= inc_pc_a;
					end
            endcase
        end
        load_byte_a: begin //get the memory to assert the byte pointed to by pc
            pc_oe <= 1;
            mem_oe <= 1;
            pc_inc_en <= 0;
            pc_inc_tap_en <= 0;
            next_state <= load_byte_b;
        end
        load_byte_b: begin
            case(ld_reg)
                reg_a: begin
                    a_wr <= 1;
                    next_state <= load_byte_c;
                end
            endcase
        end
        load_byte_c: begin
            a_wr <= 0;
            return_state <= fetch_a;
            next_state <= inc_pc_a;
        end
    endcase
    end

    //current status: I can read a single instruction from memory and execute it. 
    //this is made possible by being able to use the program counter for memory access
    //and incrementing it arbitrarily using the return_state var.
    //is this the right way to go? or should I be using an address buffer,
    //I could then write pc+some arbitrary value in order to access. 
    //then instruction fetch is slower, unless i mux it
    //still just mostly guessing how the cpu is supposed to work

    //next: implement more instructions. -- jp, add, and cmp would be good. 
    //then I could write a for loop. 
    //note - add and cmp need ALU and status flag regs. (more work)
    //maybe just jmp first 

endmodule