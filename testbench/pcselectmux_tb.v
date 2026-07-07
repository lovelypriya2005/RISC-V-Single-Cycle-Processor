module pcselectmux_tb;
reg [31:0] pc_plus4;
reg [31:0] branch_addr;
reg [31:0] pc_src;
wire [31:0] pc_next;

pcselectmux dut (
    .pc_plus4(pc_plus4),
    .branch_addr(branch_addr),
    .pc_src(pc_src),
    .pc_next(pc_next)
);
initial
begin
    $dumpfile("pcselectmux_tb.vcd");
    $dumpvars(0, pcselectmux_tb);
    $monitor("pc_plus4=%h, branch_addr=%h, pc_src=%b, pc_next=%h", pc_plus4, branch_addr, pc_src, pc_next);
    pc_plus4=32'd4;branch_addr=32'd100;pc_src=32'd0;
    #10 pc_plus4=32'd4;branch_addr=32'd100;pc_src=32'd1;
    #10 pc_plus4=32'd104;branch_addr=32'd200;pc_src=32'd0;
    #10 pc_plus4=32'd104;branch_addr=32'd200;pc_src=32'd1;
    #10 pc_plus4=32'd1000;branch_addr=32'd1500;pc_src=32'd0;
    #10 pc_plus4=32'd1000;branch_addr=32'd1500;pc_src=32'd1;
    #10 $finish;
end
endmodule