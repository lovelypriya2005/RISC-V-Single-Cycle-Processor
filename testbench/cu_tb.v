module cu_tb;
reg [6:0] opcode;
wire regwrite;
wire ALUSrc;
wire memread;
wire memwrite;
wire branch;
wire jump;
cu uut (
    .opcode(opcode),
    .regwrite(regwrite),
    .ALUSrc(ALUSrc),
    .memread(memread),
    .memwrite(memwrite),
    .branch(branch),
    .jump(jump)
);
initial
begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, cu_tb);
    $monitor("Time: %0t ,Opcode: %b ,regWrite: %b, ALUSrc: %b , MemRead: %b , MemWrite: %b , Branch: %b , Jump: %b", $time, opcode, regwrite, ALUSrc, memread, memwrite, branch, jump);
    opcode=7'b0110011; // R-type
    #10 opcode=7'b0000011; // I-type (load)
    #10 opcode=7'b0100011; // S-type (store)
    #10 opcode=7'b1100011; // B-type (branch)
    #10 opcode=7'b1101111; // J-type (jump)
    #10 opcode=7'b1111111; // Unsupported opcode
    #10 $finish;
end
endmodule