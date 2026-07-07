
reg [31:0] addr;
reg [31:0] data_in;
reg mem_write;
reg mem_read;
wire [31:0] data_out;
datamemory dut (
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .data_out(data_out)
);
initial 
begin
clk=0;
forever #5 clk=~clk;
end
initial
begin
    $dumpfile("datamem.vcd");
    $dumpvars(0, dm_tb);
    $monitor("Time: %0t, addr: %b ,Data In: %b,Mem Write: %b, Mem Read: %b,Data Out: %b", $time, addr, data_in, mem_write, mem_read, data_out);
 addr=32'd0;data_in=32'd100;mem_write=1'b1;mem_read=1'b0;
 #10 mem_write=1'b0;mem_read=1'b1;addr=32'd0;
    #10 addr=32'd4;data_in=32'd250;mem_write=1'b1;mem_read=1'b0;
    #10 mem_write=1'b0;mem_read=1'b1;addr=32'd4;
    #10 addr=32'd20;data_in=32'd18;mem_write=1'b1;mem_read=1'b0;
    #10 mem_write=1'b0;mem_read=1'b1;addr=32'd20;
    #10 addr=32'd40;mem_write=1'b0;mem_read=1'b1;
    #10 mem_write=1'b0;mem_read=1'b0;addr=32'd0;
    #10 $finish;
end
endmodule
