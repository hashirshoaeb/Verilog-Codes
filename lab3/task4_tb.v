`include "task4.v"

module task4_tb();
    reg [15:0]in;
    reg clk, reset, sel_12, sel_3;
    wire [15:0]out;
    
    task4 obj(in, clk, reset, sel_12, sel_3, out);
    initial
    begin
        $dumpfile("task4.vcd");
        $dumpvars(0, task4_tb);
        $display("done testing case %d", out);
        clk = 0;reset = 0;in = 0;sel_12 = 0;sel_3 = 0;
        #10
        reset = 1;
        #10
        // Todo: combinations left..
        $finish();
        
    end
    
    
    always // to generate clock
    begin
    #5
    clk = !clk;
    end
endmodule
