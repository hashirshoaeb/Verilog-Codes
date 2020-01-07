`timescale 1ns / 1ps
`include "sobel.v"

module sobel_tb();
    reg clk, reset;
    
    sobel obj(clk, reset);
    
    initial
    begin
        $dumpfile("sobel.vcd");
        $dumpvars(0, sobel_tb);
        reset = 1;
        #1
        reset = 0;
        clk   = 0;
        #1
        reset = 1;
    end
    
    
    always // to generate clock
    begin
    #10
    clk = !clk;
    end
    
endmodule
