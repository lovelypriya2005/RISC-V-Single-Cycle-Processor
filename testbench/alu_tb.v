module alu_tb;
reg [31:0]a,b;
reg [3:0]alu_crtl;
wire zero;
wire [31:0]result;

alu dut(a,b,alu_crtl,zero,result);
initial
begin
$dumpfile("waveform.vcd");
$dumpvars(0,alu_tb);
$monitor("time=%0t,a=%b,b=%b,alu_crtl=%b,zero=%b,result=%b",$time,a,b,alu_crtl,zero,result);
a=10;b=5;alu_crtl=4'b0000;
#5 alu_crtl=4'b0001;
#5 a=12;b=10;alu_crtl=4'b0010;
#5 alu_crtl=4'b0011;
#5 alu_crtl=4'b0100;
#5 a=5;b=2;alu_crtl=4'b0101;
#5 a=20;alu_crtl=4'b0110;
#5 a=-8;alu_crtl=4'b0111;
#5 a=-1;b=1;alu_crtl=4'b1000;
#5 a=32'hFFFFFFFF;b=1;alu_crtl=4'b1001;
#5 $finish;
end
endmodule
