module datamemory(
    input clk,
    input [31:0] addr,
    input [31:0] data_in,
    input mem_write,
    input mem_read,
    output reg [31:0] data_out
);

    reg [31:0] memory [0:255]; // 1KB memory

    always @(*) begin
        if (mem_read) begin
            data_out = memory[addr[9:2]]; // Read data from memory
        end else begin
            data_out = 32'b0; // Default value when not reading
        end
    end

    always @(posedge clk) begin
        if (mem_write) begin
            memory[addr[9:2]] <= data_in; // Write data to memory
        end
    end
endmodule
 