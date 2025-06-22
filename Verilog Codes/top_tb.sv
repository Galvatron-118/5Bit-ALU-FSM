`timescale 1ns/1ns

module top_tb;
    reg start, clk, reset;
    wire [4:0] R;
    wire ZF;

    top DUT (
        .start(start),
        .clk(clk),
        .reset(reset),
        .R(R),
        .ZF(ZF));
    
    initial begin 
        clk  = 0;
        forever #5 clk = ~clk;
    end    

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, top_tb);
        
        reset <= 0;
        start <= 0;
        clk <= 0;

        #20; reset <= 1;
        #20; start <= 1;
        #100;
        $finish();
    end
endmodule
