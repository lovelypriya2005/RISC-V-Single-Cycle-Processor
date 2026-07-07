module writebackmux_tb;
reg [31:0] alu_result;
reg [31:0] mem_data;
reg ResultSrc;
wire [31:0] writeback_data;

writeback_mux uut (
    .alu_result(alu_result),
    .mem_data(mem_data),
    .ResultSrc(ResultSrc),
    .writeback_data(writeback_data)
);
initial
begin
    $dumpfile("writeback_mux_tb.vcd");
    $dumpvars(0, writebackmux_tb);
    $monitor("alu_result=%h, mem_data=%h, ResultSrc=%b, writeback_data=%h", alu_result, mem_data, ResultSrc, writeback_data);
    alu_result=32'd100;mem_data=32'd500;ResultSrc=0;
    #10;alu_result=32'd100;mem_data=32'd500;ResultSrc=1;
    #10;alu_result=32'd250;mem_data=32'd999;ResultSrc=0;
    #10;alu_result=32'd250;mem_data=32'd999;ResultSrc=1;
    #10;alu_result=32'hAAAA_BBBB;mem_data=32'd1234_5678;ResultSrc=0;
    #10;alu_result=32'hAAAA_BBBB;mem_data=32'd1234_5678;ResultSrc=1;
end