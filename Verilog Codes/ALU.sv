module ALU (
    input wire op,
    input wire [4:0] A, B,
    output reg [4:0] R,
    output wire ZF);
    
    wire [4:0] R_xor, R_ror;
    reg [4:0] R_comp;



    ALU_XOR alu_XOR (
        .A(A),
        .B(B),
        .R(R_xor)
    );

    ALU_ROR alu_ROR (
        .A(A),
        .B(B),
        .R(R_ror)
    );

    ALU_FLAG alu_FLAG(
        .R_in(R),
        .ZF(ZF)
    );

always @(*) 
    begin
        if(op) begin
            R = R_ror;
            R_comp = R_ror;
        end
        else begin
            R = R_xor;
            R_comp = R_xor;
        end
           
    end












    



endmodule