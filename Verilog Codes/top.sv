module top(
    input wire clk, reset, start,
    output wire [4:0] R,
    output wire ZF);

wire [4:0] fsm_A, fsm_B;
wire op;

FSM fsm(
            .clk(clk),
            .reset(reset),
            .start(start),
            .A(fsm_A),
            .B(fsm_B),
            .op(op));

ALU alu(
            .A(fsm_A),
            .B(fsm_B),
            .op(op),
            .R(R),
            .ZF(ZF));

endmodule