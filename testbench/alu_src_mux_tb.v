module aluscrc_tb;
reg [31:0] reg_data2;
reg [31:0] imm_out;
reg  ALUSrc;
wire [31:0] alu_in2;
alu_src_mux uut (
    .reg_data2(reg_data2),
    .imm_out(imm_out),
    .ALUSrc(ALUSrc),
    .alu_in2(alu_in2)
);
initial
begin
    $dumpfile("alu_src_mux_tb.vcd");
    $dumpvars(0, aluscrc_tb);
    $monitor("reg_data2=%h, imm_out=%h, ALUSrc=%b, alu_in2=%h", reg_data2, imm_out, ALUSrc, alu_in2);
    reg_data2=32'bd25;imm_out=32'd100;ALUSrc=1'b0;
    #10;reg_data2=32'd25;imm_out=32'd100;ALUSrc=1'b1;
    #10;reg_data2=32'd50;imm_out=32'd200;ALUSrc=1'b0;
    #10;reg_data2=32'd50;imm_out=32'd200;ALUSrc=1'b1;
    #10;reg_data2=32'd0;imm_out=32'd999;ALUSrc=1'b0;
    #10;reg_data2=32'd123;imm_out=32'd0;ALUSrc=1'b1;

end
endmodule