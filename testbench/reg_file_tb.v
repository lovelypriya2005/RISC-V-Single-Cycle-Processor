module regtb;
 reg clk;
    //input rst,
    reg  [4:0] rs1_addr;
    reg [4:0] rs2_addr;
    reg [4:0] rd_addr;
    reg [31:0] rd_data;
    reg reg_write_en;
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;
regfile dut(clk,rs1_addr,rs2_addr,rd_addr,rd_data,reg_write_en,rs1_data,rs2_data);

always #5 clk=~clk;

initial
begin

$dumpfile("waveform.vcd");
$dumpvars(0,regtb);
$monitor("time=%0t,clk=%b,rs1_addr=%b,rs2_addr=%b,rd_addr=%b,rd_data=%b,reg_write_en=%b,rs1_data=%b,rs2_data=%b",$time,clk,rs1_addr,rs2_addr,rd_addr,rd_data,reg_write_en,rs1_data,rs2_data);
clk=0;
reg_write_en=0;
rs1_addr=0;
rs2_addr=0;
rd_addr=0;
rd_data=0;
//write 100 to x5
#10 reg_write_en=1;
rd_addr=5;
rd_data=100;
//read x5
#10 reg_write_en=0;
rs1_addr=5;
//write 55 into x10
#10 reg_write_en=1;
rd_addr=10;
rd_data=55;
//read x5 and x10
#10 reg_write_en=0;
rs1_addr=5;
rs2_addr=10;
//x0 test
#10 reg_write_en=1;
rd_addr=0;
rd_data=32;
#10 reg_write_en=0;
rs1_addr=0;
#10 $finish;
end
endmodule