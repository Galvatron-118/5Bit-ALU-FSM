iverilog -o a ALU.sv ALU_ROR.sv ALU_XOR.sv ALU_FLAG.sv FSM.sv top.sv top_tb.sv
vvp a
gtkwave test.vcd
