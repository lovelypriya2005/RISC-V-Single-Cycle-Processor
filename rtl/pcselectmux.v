module pcselectmux(
    input [31:0] pc_plus4,//pc+4
    input [31:0] branch_addr,//branch/jump target
    input pc_src,//if 0 then pc+4 ,if 1 then branch/jump target
    output [31:0] pc_next
);
assign pc_next = (pc_src == 1'b0) ? pc_plus4 : branch_addr;
endmodule