module cu(
    input [6:0] opcode,
    output reg regwrite,
    output reg ALUSrc,
    output reg memread,
    output reg memwrite,
    output reg branch,
    output reg jump,
    output reg [1:0]  resultsrc
);
always @(*) begin
    case (opcode)
        7'b0110011: begin // R-type
            regwrite = 1;
            ALUSrc = 0;
            memread = 0;
            memwrite = 0;
            branch = 0;
            jump = 0;
            resultsrc = 2'b00;
        end
        7'b0010011: begin // I-type Arithmetic (ADDI, ANDI, ORI, etc.)
            regwrite = 1;
            ALUSrc   = 1;
            memread  = 0;
            memwrite = 0;
            branch   = 0;
            jump     = 0;
            resultsrc = 2'b00;
        end
        7'b0000011: begin // I-type (load)
            regwrite = 1;
            ALUSrc = 1;
            memread = 1;
            memwrite = 0;
            branch = 0;
            jump = 0;
            resultsrc = 2'b01;
        end
        7'b0100011: begin // S-type (store)
            regwrite = 0;
            ALUSrc = 1;
            memread = 0;
            memwrite = 1;
            branch = 0;
            jump = 0;
            resultsrc = 2'b00;
        end
        7'b1100011: begin // B-type (branch)
            regwrite = 0;
            ALUSrc = 0; // Don't care
            memread = 0;
            memwrite = 0;
            branch = 1;
            jump = 0;
            resultsrc = 2'b00;
        end
        7'b1101111: begin // J-type (jump)
            regwrite = 1; // For jal
            ALUSrc = 0; // Don't care
            memread = 0;
            memwrite = 0;
            branch = 0;
            jump = 1;
            resultsrc = 2'b10;
        end
        default: begin // Default case for unsupported opcodes
            regwrite = 0;
            ALUSrc = 0; // Don't care
            memread = 0;
            memwrite = 0;
            branch = 0;
            jump = 0;
            resultsrc = 2'b00;
        end
    endcase
end

endmodule