module alu(
    input [31:0]a,
    input [31:0]b,
    input [3:0] alu_ctrl,
    output zero,
    output reg [31:0] result
);
always@(*)
begin
    case(alu_ctrl)
    4'b0000:result=a+b;  //add
    4'b0001:result=a-b;  //sub
    4'b0010:result=a&b;  //and
    4'b0011:result=a|b;  //or
    4'b0100:result=a^b;  //xor
    4'b0101:result=a<<b[4:0];  //shift left logical
    4'b0110:result=a>>b[4:0];  //shift right logical
    4'b0111:result=$signed(a)>>>b[4:0];  //shift right arithmetic
    4'b1000:result=($signed(a)<$signed(b))?32'b1:32'b0;  //set less than
    4'b1001:result=(a<b)?32'd1:32'd0; //set less than unsigned
    default:result=32'b0;
    endcase
end
assign zero=(result==32'b0); 
endmodule