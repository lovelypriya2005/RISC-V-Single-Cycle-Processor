module branchjumpaddertb;
reg [31:0] pc;
reg [31:0] imm;
wire [31:0] branch_addr;
branchjumpadder dut (
    .pc(pc),
    .imm(imm),
    .branch_addr(branch_addr)
);
initial
begin
    $dumpfile("branchjumpadder_tb.vcd");
    $dumpvars(0, branchjumpaddertb);
    $monitor("pc=%h, imm=%h, branch_addr=%h", pc, imm, branch_addr);
    pc=32'd0;imm=32'd16;
    #10;pc=32'd100;imm=32'd20;
    #10;pc=32'd200;imm=32'd40;
    #10;pc=32'd1000;imm=32'd8;
    #10;pc=32'd400;imm=32'd0;
end 
endmodule