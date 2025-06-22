module ALU_FLAG(
    input wire [4:0] R_in,
    output wire ZF);
    
    assign ZF = (R_in == 5'b00000) ? 1'b1 : 1'b0;

endmodule
