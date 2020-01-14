`timescale 1ns / 1ps
`include "sobel.v"

module sobel_tb();
    reg clk, reset;
    wire d;
    wire [12:0] l4;
    sobel obj(clk, reset, d, l4);
    
    reg [7:0] ROM_OUT [0:4095];
    always@(posedge clk)
    begin
        ROM_OUT[l4] = d;
        $File       = $fopen("temp_out.txt", "a+");
        fwrite($File, d, 8);
        fclose($File);
    end
    
    
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
