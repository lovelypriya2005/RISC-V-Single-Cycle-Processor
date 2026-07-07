module alu_cu(
    input [6:0]opcode,
    input [2:0]funct3,
    input [6:0]funct7,
    output reg [3:0]alu_ctrl
);
always@(*)
begin
    case(opcode)
        7'b0110011: // R-type
            begin
                case(funct3)
                    3'b000: alu_ctrl = (funct7[5]) ? 4'b0001 : 4'b0000; // SUB or ADD
                    3'b001: alu_ctrl = 4'b0101; // SLL
                    3'b010: alu_ctrl = 4'b1000; // SLT
                    3'b011: alu_ctrl = 4'b1001; // SLTU
                    3'b100: alu_ctrl = 4'b0100; // XOR
                    3'b101: alu_ctrl = (funct7[5]) ? 4'b0111 : 4'b0110; // SRL or SRA
                    3'b110: alu_ctrl = 4'b0011; // OR
                    3'b111: alu_ctrl = 4'b0010; // AND
                    default: alu_ctrl = 4'bxxxx;
                endcase
            end
        7'b0010011: // I-type
            begin
                case(funct3)
                    3'b000: alu_ctrl = 4'b0000; // ADDI
                    3'b001: alu_ctrl = 4'b0101; // SLLI
                    3'b010: alu_ctrl = 4'b1000; // SLTI
                    3'b011: alu_ctrl = 4'b1001; // SLTIU
                    3'b100: alu_ctrl = 4'b0100; // XORI
                    3'b101: alu_ctrl = (funct7[5]) ? 4'b0111 : 4'b0110; // SRLI or SRAI
                    3'b110: alu_ctrl = 4'b0011; // ORI
                    3'b111: alu_ctrl = 4'b0010; // ANDI
                    default: alu_ctrl = 4'bxxxx;
                endcase
            end
        7'b0000011, // I-type (load)
        7'b0100011: // S-type (store)
            alu_ctrl = 4'b0000; // ADD for address calculation
        7'b1100011: // B-type (branch)
            alu_ctrl = 4'b0001; // SUB for comparison
        7'b1101111: // J-type (jump)
            alu_ctrl = 4'b0000; // ADD for PC calculation
        7'b1110011: // ECALL/EBREAK
            alu_ctrl = 4'b0000; // NOP or custom code

        default: alu_ctrl = 4'b0000;
    endcase
end
endmodule
