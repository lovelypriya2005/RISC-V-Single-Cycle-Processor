module riscv_top (
    input clk,
    input reset//to start execution from address 0

);

// Program Counter
wire [31:0] pc;
wire [31:0] pc_next;

pc pc_inst (
    .clk(clk),
    .rst(reset),
    .pc_next(pc_next),
    .pc(pc)
);

// Instruction Memory
wire [31:0] instruction;
im im_inst (
    .pc(pc),
    .instruction(instruction)
);

//pc+4 adder
wire [31:0] pc_plus4;
pcadder pcadder_inst (
    .pc(pc),
    .pc_next(pc_plus4)
);

//immediate generator
wire [31:0] imm_out;
imm_gen ig_inst (
    .instruction(instruction),
    .imm_out(imm_out)
);
//control unit
wire regwrite, ALUSrc, memread, memwrite, branch, jump;
wire [1:0] resultsrc;
cu cu_inst (
    .opcode(instruction[6:0]),
    .regwrite(regwrite),
    .ALUSrc(ALUSrc),
    .memread(memread),
    .memwrite(memwrite),
    .branch(branch),
    .jump(jump),
    .resultsrc(resultsrc)
);

//alu control unit
wire [3:0] alu_ctrl;
alu_cu alu_cu_inst (
    .opcode(instruction[6:0]),
    .funct3(instruction[14:12]),
    .funct7(instruction[31:25]),
    .alu_ctrl(alu_ctrl)
);

// Register File
wire [31:0] writeback_data;
wire [31:0] rs1_data, rs2_data;
regfile regfile_inst (
    .clk(clk),
    .rs1_addr(instruction[19:15]),
    .rs2_addr(instruction[24:20]),
    .rd_addr(instruction[11:7]),
    .rd_data(writeback_data), // Assuming writeback_data is defined elsewhere
    .reg_write_en(regwrite),
    .rs1_data(rs1_data),
    .rs2_data(rs2_data)
);

//alusrc mux
wire [31:0] alu_in2;
alu_src_mux alu_src_mux_inst (
    .reg_data2(rs2_data),
    .imm_out(imm_out),
    .ALUSrc(ALUSrc),
    .alu_in2(alu_in2)
);

// ALU
wire [31:0] alu_result;
wire zero;
alu alu_inst (
    .a(rs1_data),
    .b(alu_in2),
    .alu_ctrl(alu_ctrl),
    .zero(zero),
    .result(alu_result)
);
//branch/jump adder
wire [31:0] branch_addr;
branchjumpadder branchjumpadder_inst (
    .pc(pc),
    .imm(imm_out),
    .branch_addr(branch_addr)
);
//pc select mux
wire pc_src;
assign pc_src = jump | (branch & zero) ; // Assuming zero is defined elsewhere
pcselectmux pcselectmux_inst (
    .pc_plus4(pc_plus4),
    .branch_addr(branch_addr),
    .pc_src(pc_src),
    .pc_next(pc_next)
);

// Data Memory
wire [31:0] data_out;
datamemory datamemory_inst (
    .clk(clk),
    .addr(alu_result), // Assuming alu_result is the address for data memory
    .data_in(rs2_data), // Assuming rs2_data is the data to write
    .mem_write(memwrite),
    .mem_read(memread),
    .data_out(data_out)
);
//write back mux
writeback_mux writebackmux_inst(
    .alu_result(alu_result),
    .mem_data(data_out),
    .pc_plus4(pc_plus4),
    .ResultSrc(resultsrc),
    .writeback_data(writeback_data)
);
endmodule

