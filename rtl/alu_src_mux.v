module alu_src_mux(
    input  [31:0] reg_data2,
    input  [31:0] imm_out,
    input         ALUSrc,
    output [31:0] alu_in2
);
assign alu_in2 = (ALUSrc) ? imm_out : reg_data2;
endmodule
