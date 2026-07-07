module imtb;
reg [31:0] pc;
wire [31:0] instruction;
im dut(
    .pc(pc),
    .instruction(instruction)
);

initial
begin
$dumpfile("waveform.vcd");
$dumpvars(0,imtb);
$monitor("time=%0t, pc=%b, instruction=%b",$time,pc,instruction);
    pc=32'd0;
    #10 pc=32'd4;
    #10 pc=32'd8;
    #10 pc=32'd12;
#10 $finish;
end
endmodule