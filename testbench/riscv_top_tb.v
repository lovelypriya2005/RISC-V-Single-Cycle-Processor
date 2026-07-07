`timescale 1ns/1ps

module riscv_top_tb;

reg clk;
reg reset;

riscv_top dut(
    .clk(clk),
    .reset(reset)
);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    reset = 1;
    #10;
    reset = 0;
end
endmodule