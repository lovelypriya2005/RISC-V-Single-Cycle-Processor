module branchjumpadder(
    input [31:0] pc,
    input [31:0] imm,
    output [31:0] branch_addr
    
);

    assign branch_addr = pc + imm ;
    endmodule