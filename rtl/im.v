module im(
    input [31:0] pc,
    output reg [31:0] instruction
);
reg[31:0] mem[0:31];

initial
begin
    $readmemh("program.mem", mem); //readmeh means to read the memory in hex format and store the values in the memory array
end
/*
initial
begin
    mem[0]=32'hAAAAAAAA;
    mem[1]=32'hBBBBBBBB;
    mem[2]=32'hCCCCCCCC;
    mem[3]=32'hDDDDDDDD;
end
*/

always @(*)
begin
    instruction=mem[pc[31:2]];
end
endmodule