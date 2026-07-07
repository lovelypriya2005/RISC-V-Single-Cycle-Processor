module imm_gen_tb;

reg  [31:0] instruction;
wire [31:0] imm_out;

imm_gen dut(
    .instruction(instruction),
    .imm_out(imm_out)
);

initial begin

    $monitor("time=%0t instruction=%h imm_out=%h",
              $time, instruction, imm_out);

    // I-Type: addi x5, x1, 10
    instruction = 32'h00A08293; // correct encoding
    #10;

    // I-Type: addi x5, x1, -1
    instruction = 32'hFFF08293;
    #10;

    // Load: lw x5, 20(x1)
    instruction = 32'h0140A283;
    #10;

    // S-Type: sw x5, 16(x1)
    instruction = 32'h0050A823;
    #10;

    // B-Type: beq x1, x2, +8
    instruction = 32'h00208463;
    #10;

    // U-Type: lui x5, 0x12345
    instruction = 32'h123452B7;
    #10;

    // J-Type: jal x1, +32
    instruction = 32'h020000EF;
    #10;

    // Invalid
    instruction = 32'hFFFFFFFF;
    #10;

    $finish;
end

endmodule