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
    output reg gen_16b,
    output reg gen_oe,
    output reg gen_wr,
    output reg gen_lr_sel,
    output reg[2:0] gen_sel,

    output reg abuf_bypass,
    output reg abuf_latch,
    output reg abuf_oe,

    output reg mem_cs,
    output reg mem_oe
);

    //arbitrary constants
    wire const1;
    assign const1 = 1;

    reg[7:0] opcode;
    reg[15:0] addr_scratch;
    reg[7:0] scratch;
    reg[15:0] current_state, next_state, return_state;
    reg assert_addr;
    reg[3:0] ld_reg;
    reg [1:0] ptr_reg;

    localparam[1:0]
        //gen_sel enums
        regs_bc = 2'h0,
        regs_de = 2'h1,
        regs_hl = 2'h2;

    localparam[3:0]
        //register enums
        reg_a = 4'h0,
        reg_f = 4'h1,
        reg_b = 4'h2,
        reg_c = 4'h3,
        reg_d = 4'h4,
        reg_e = 4'h5,
        reg_h = 4'h6,
        reg_l = 4'h7,
        reg_gen = 4'h8,
        reg_pch = 4'h9,
        reg_pcl = 4'ha,
        reg_pc = 4'hb;

    reg[15:0] reset_vec;

    assign addr_bus = assert_addr ? addr_scratch : 'hz;

    //local params must aggree with those in decode.v
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
        load_byte_imm_a = 16'hff09,
        load_byte_imm_b = 16'hff0a,
        load_byte_imm_c = 16'hff0b,
        load_byte_a16_a = 16'hff0c,
        load_byte_a16_b = 16'hff0d,
        load_byte_a16_c = 16'hff0e,
        jp_imm16_a = 16'hff0f;

        //connections to decode module
        reg decode_en;
        wire[3:0] decode_rtn_ld_reg;
        wire[1:0] decode_rtn_ptr_reg;
        wire[15:0] decode_rtn_next_state;
        wire[15:0] decode_rtn_return_state;
        wire[15:0] decode_rtn_reset_vec;

        decode inst_decode(
            .en(decode_en),
            .opcode(opcode),
            .ld_reg(decode_rtn_ld_reg),
            .ptr_reg(decode_rtn_ptr_reg),
            .return_state(decode_rtn_return_state),
            .next_state(decode_rtn_next_state),
            .reset_vec(decode_rtn_reset_vec)
        );

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            reset_vec <= 16'h0000;
            current_state <= reset;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(current_state) begin
    next_state <= current_state; //when no case is satisfied, remain on current state
    case(current_state)
        reset: begin
            decode_en <= 0;
            mem_cs <= 1;
            mem_oe <= 0;
            a_oe <= 0;
            a_wr <= 0;
            gen_16b <= 0;
            gen_oe <= 0;
            gen_wr <= 0;
            gen_lr_sel <= 0;
            gen_sel <= 0;
            pc_oe <= 0;
            pc_wr <= 0;
            pc_ldh <= 0;
            pc_ld16 <= 0;
            pc_inc_en <= 0;
            pc_inc_tap_en <= 0;
            abuf_bypass <= 1;
            abuf_oe <= 0;
            abuf_latch <= 0;
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
            gen_wr <= 0;
            a_wr <= 0;
            abuf_oe <= 0;
            abuf_bypass <= 1;
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
            decode_en <= 1;
            next_state <= decode_a;
        end
        decode_a: begin
            pc_oe <= 0;
            //get next state from decode logic
            ld_reg <= decode_rtn_ld_reg;
            ptr_reg <= decode_rtn_ptr_reg;
            reset_vec <= decode_rtn_reset_vec;
            return_state <= decode_rtn_return_state;
            next_state <= decode_rtn_next_state;
        end
        load_byte_imm_a: begin
            //get the memory to assert the byte pointed to by pc
            decode_en <= 0;
            pc_oe <= 1;
            mem_oe <= 1;
            pc_inc_en <= 0;
            pc_inc_tap_en <= 0;
            next_state <= load_byte_imm_b;
        end
        load_byte_imm_b: begin
            case(ld_reg)
                reg_a: a_wr <= 1;
                reg_b, reg_c, reg_d, reg_e, reg_h, reg_l: gen_wr <= 1;
                reg_pch: reset_vec[15:8] <= data_bus;
                reg_pcl: reset_vec[7:0] <= data_bus;
            endcase
            case(ld_reg)
                reg_b, reg_c: gen_sel <= regs_bc;
                reg_d, reg_e: gen_sel <= regs_de;
                reg_h, reg_l: gen_sel <= regs_hl;
            endcase
            case(ld_reg)
                reg_b, reg_d, reg_h: gen_lr_sel <= 0;
                reg_c, reg_e, reg_l: gen_lr_sel <= 1;
            endcase
            next_state <= load_byte_imm_c;
        end
        load_byte_imm_c: begin
            return_state <= fetch_a;
            next_state <= inc_pc_a;
            case(ld_reg)
                reg_a: a_wr <= 0;
                reg_b, reg_c, reg_d, reg_e, reg_h, reg_l: gen_wr <= 0;
                reg_pcl: begin 
                    ld_reg <= reg_pch;
                    return_state <= load_byte_imm_a;
                end
                reg_pch: next_state <= reset;
            endcase
        end
        load_byte_a16_a: begin
            //assert the pointer on the address bus, and latch it into the buffer
            decode_en <= 0;
            mem_oe <= 0;
            gen_oe <= 1;
            gen_16b <= 1;
            gen_sel <= ptr_reg;
            abuf_latch <= 0;
            abuf_bypass <= 0;
            next_state <= load_byte_a16_b;
        end
        load_byte_a16_b: begin
            //keep asserting the address, load the byte into the register
            abuf_oe <= 1;
            gen_16b <= 0;
            abuf_latch <= 1;
            gen_oe <= 0;
            case(ld_reg)
                reg_b, reg_c: gen_sel <= 0;
                reg_d, reg_e: gen_sel <= 1;
                reg_h, reg_l: gen_sel <= 2;
            endcase
            case(ld_reg)
                reg_b, reg_d, reg_h: gen_lr_sel <= 0;
                reg_c, reg_e, reg_l: gen_lr_sel <= 1;
            endcase
            next_state <= load_byte_a16_c;
        end
        load_byte_a16_c: begin
            case(ld_reg)
                reg_b, reg_d, reg_h, reg_c, reg_e, reg_l: gen_wr <= 1;
                reg_a: a_wr <= 1;
            endcase
            mem_oe <= 1;
            return_state <= fetch_a;
            next_state <= inc_pc_a;
        end
        jp_imm16_a: begin
        //the pc will need to be incremented twice.

        end
    endcase
    end

endmodule