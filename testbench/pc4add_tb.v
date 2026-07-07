module pcadder_tb;
reg [31:0] pc;
wire [31:0] pc_next;
pcadder dut (
    .pc(pc),
    .pc_next(pc_next)
);
initial
begin
    $dumpfile("pcadder_tb.vcd");
    $dumpvars(0, pcadder_tb);
    $monitor("pc: %h, pc_next: %h", pc, pc_next);
pc=32'h00000000; #10;
pc=32'd100;
#10 pc=32'd4;
#10 pc=32'd8;
end 
endmodule
