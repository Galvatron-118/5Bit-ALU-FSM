module ALU_ROR(
    input wire [4:0] A, B,
    output reg [4:0] R);

    always @(*) begin
        case(B)
            5'b00000: R = A;                     
            5'b00001: R = {A[0], A[4:1]};        
            5'b00010: R = {A[1:0], A[4:2]};   
            5'b00011: R = {A[2:0], A[4:3]}; 
            5'b00100: R = {A[3:0], A[4]};      
            default: R = A;                 
        endcase
    end

endmodule