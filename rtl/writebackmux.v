/*
module writeback_mux (
    input  wire [31:0] alu_result,
    input  wire [31:0] mem_data,
    input  wire ResultSrc,
    output wire [31:0] writeback_data
);
assign writeback_data = (ResultSrc) ? mem_data : alu_result;
endmodule
*/

module writeback_mux (
    input wire [31:0] alu_result,
    input wire [31:0] mem_data,
    input wire [31:0] pc_plus4,
    input wire [1:0] ResultSrc,
    output reg [31:0] writeback_data
);

always @(*) begin
    case (ResultSrc)
        2'b00: writeback_data = alu_result;
        2'b01: writeback_data = mem_data;
        2'b10: writeback_data = pc_plus4;
        default: writeback_data = 32'b0;
    endcase
end

endmodule