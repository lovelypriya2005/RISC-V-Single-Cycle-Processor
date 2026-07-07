module regfile(
    input clk,
    //input rst,
    input  [4:0] rs1_addr,
    input [4:0] rs2_addr,
    input [4:0] rd_addr,
    input [31:0] rd_data,
    input reg_write_en,
    output [31:0] rs1_data,
    output [31:0] rs2_data

);
//32 registers of 32 bits each
 reg[31:0] reg_array[31:0];
integer i;

initial begin
    for (i = 0; i < 32; i = i + 1)
        reg_array[i] = 32'b0;
end
//read logic

    assign rs1_data=(rs1_addr==0)?32'b0:reg_array[rs1_addr];
    assign rs2_data=(rs2_addr==0)?32'b0:reg_array[rs2_addr];
 //write logic
  always@(posedge clk)
 begin
    if(reg_write_en && (rd_addr!=0))
    begin
        reg_array[rd_addr]<=rd_data;
    end
 end
endmodule