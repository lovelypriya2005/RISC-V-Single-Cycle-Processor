module pctb;
reg clk;
reg rst;
reg [31:0]pc_next;
wire [31:0]pc;
pc dut (clk,rst,pc_next,pc);
always #5 clk=~clk;
initial
begin
$dumpfile("waveform.vcd");
$dumpvars(0,pctb);
$monitor("time=%0t,clk=%b,rst=%b,pc_next=%b,pc=%b",$time,clk,rst,pc_next,pc);
clk=0;rst=1;
#10  rst=0;pc_next=4;
#10 pc_next=8;
#10 pc_next=100;
#10 $finish; 
end
endmodule