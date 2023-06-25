module decode(
    //asyncronous combinational logic. No clk signal required.
    input en,
    input[7:0] opcode,
    output reg[3:0] ld_reg,
    output reg[1:0] ptr_reg,
    output reg[15:0] return_state,
    output reg[15:0] next_state,
    output reg[15:0] reset_vec
);

    //these params must aggree with those in control.v
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
        load_byte_a16_c = 16'hff0e;

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
        reg_gen = 4'h8;

    localparam[7:0]
        //opcodes--------------|
        //8 bit immediate loads
        ldc_d8 = 8'h0e,
        lde_d8 = 8'h1e,
        ldl_d8 = 8'h2e,
        lda_d8 = 8'h3e,
        ldb_d8 = 8'h06,
        ldd_d8 = 8'h16,
        ldh_d8 = 8'h26,
        //load 8-bit data from [hl]
        ldc_p_hl = 8'h4e,
        lde_p_hl = 8'h5e,
        ldl_p_hl = 8'h6e,
        lda_p_hl = 8'h7e,
        ldb_p_hl = 8'h46,
        ldd_p_hl = 8'h56,
        ldh_p_hl = 8'h66,
        //reset vectors
        rst_0h = 8'hc7,
        rst_10h = 8'hd7,
        rst_20h = 8'he7,
        rst_30h = 8'hf7,
        rst_08h = 8'hcf,
        rst_18h = 8'hdf,
        rst_28h = 8'hef,
        rst_38h = 8'hff;

    always @(*) begin
        if (en) begin
            reset_vec <= 16'h0000; //reset vector is 0 unless otherwise specified.
            case(opcode)
                ldc_d8: begin
                    ld_reg <= reg_c;
                    return_state <= load_byte_imm_a;
                    //increment pc to access the following byte
                    next_state <= inc_pc_a;
                end
                lde_d8: begin
                    ld_reg <= reg_e;
                    return_state <= load_byte_imm_a;
                    next_state <= inc_pc_a;
                end
                ldl_d8: begin
                    ld_reg <= reg_l;
                    return_state <= load_byte_imm_a;
                    next_state <= inc_pc_a;
                end
                lda_d8: begin
                    ld_reg <= reg_a;
                    return_state <= load_byte_imm_a;
                    next_state <= inc_pc_a;
                end
                ldb_d8: begin
                    ld_reg <= reg_b;
                    return_state <= load_byte_imm_a;
                    next_state <= inc_pc_a;
                end
                ldd_d8: begin
                    ld_reg <= reg_d;
                    return_state <= load_byte_imm_a;
                    next_state <= inc_pc_a;
                end
                ldh_d8: begin
                    ld_reg <= reg_h;
                    return_state <= load_byte_imm_a;
                    next_state <= inc_pc_a;
                end
                lda_p_hl: begin
                    ld_reg <= reg_a;
                    ptr_reg <= regs_hl;
                    next_state <= load_byte_a16_a;
                end
                ldc_p_hl: begin
                    ld_reg <= reg_c;
                    ptr_reg <= regs_hl;
                    next_state <= load_byte_a16_a;
                end
                lde_p_hl: begin
                    ld_reg <= reg_e;
                    ptr_reg <= regs_hl;
                    next_state <= load_byte_a16_a;
                end
                ldl_p_hl: begin
                    ld_reg <= reg_l;
                    ptr_reg <= regs_hl;
                    next_state <= load_byte_a16_a;
                end
                ldb_p_hl: begin
                    ld_reg <= reg_b;
                    ptr_reg <= regs_hl;
                    next_state <= load_byte_a16_a;
                end
                ldd_p_hl: begin
                    ld_reg <= reg_d;
                    ptr_reg <= regs_hl;
                    next_state <= load_byte_a16_a;
                end
                ldh_p_hl: begin
                    ld_reg <= reg_h;
                    ptr_reg <= regs_hl;
                    next_state <= load_byte_a16_a;
                end                
                rst_0h: begin
                    reset_vec <= 16'h0000;
                    next_state <= reset;
                end
                rst_10h: begin
                    reset_vec <= 16'h0010;
                    next_state <= reset;
                end
                rst_20h: begin
                    reset_vec <= 16'h0020;
                    next_state <= reset;
                end
                rst_30h: begin
                    reset_vec <= 16'h0030;
                    next_state <= reset;
                end
                rst_08h: begin
                    reset_vec <= 16'h0008;
                    next_state <= reset;
                end
                rst_18h: begin
                    reset_vec <= 16'h0018;
                    next_state <= reset;
                end
                rst_28h: begin
                    reset_vec <= 16'h0028;
                    next_state <= reset;
                end
                rst_38h: begin
                    reset_vec <= 16'h0038;
                    next_state <= reset;
                end
                default: begin
                    return_state <= fetch_a;
                    next_state <= inc_pc_a;
                    end
            endcase
        end
    end

endmodule