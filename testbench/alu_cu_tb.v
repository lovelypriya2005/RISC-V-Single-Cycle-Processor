module alu_cu_tb;
reg [6:0]opcode;
reg [2:0]funct3;
reg [6:0]funct7;
alu_cu uut (
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .alu_crtl(alu_crtl)
);
$dumpfile("waveform.vcd");
$dumpvars(0, alu_cu_tb);
$monitor("opcode: %b, funct3: %b, funct7: %b, alu_crtl: %b", opcode, funct3, funct7, alu_crtl);
initial begin
    // Test R-type instructions
    opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0000000; #10; // ADD
    opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0100000; #10; // SUB
     opcode = 7'b0110011; funct3 = 3'b111; funct7 = 7'b0000000; #10; // AND
     opcode = 7'b0110011; funct3 = 3'b110; funct7 = 7'b0000000; #10; // OR
     opcode = 7'b0110011; funct3 = 3'b100; funct7 = 7'b0000000; #10; // XOR
    opcode = 7'b0110011; funct3 = 3'b001; funct7 = 7'b0000000; #10; // SLL
    opcode = 7'b0110011; funct3 = 3'b101; funct7 = 7'b0000000; #10; // SRL
    opcode = 7'b0110011; funct3 = 3'b101; funct7 = 7'b0100000; #10; // SRA
    opcode = 7'b0110011; funct3 = 3'b010; funct7 = 7'b0000000; #10; // SLT
    opcode = 7'b0110011; funct3 = 3'b011; funct7 = 7'b0000000; #10; // SLTU
    

    // Test I-type instructions
    opcode = 7'b0010011; funct3 = 3'b000; funct7 = 7'bxxxxxxx; #10; // ADDI
    opcode = 7'b0010011; funct3 = 3'b111; funct7 = 7'bxxxxxxx; #10; // ANDI
    opcode = 7'b0010011; funct3 = 3'b110; funct7 = 7'bxxxxxxx; #10; // ORI

    opcode = 7'b0000011; funct3 = 3'b000; funct7 = 7'b0000000; #10; // lw
    opcode = 7'b0100011; funct3 = 3'b000; funct7 = 7'b0000000; #10; // sw
    opcode = 7'b1100011; funct3 = 3'b000; funct7 = 7'b0000000; #10; // beq
    opcode = 7'b1101111; funct3 = 3'b000; funct7 = 7'b0000000; #10; // jal

    $finish;
end
endmodule
    
    