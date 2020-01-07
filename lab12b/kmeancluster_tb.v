`include "kmeancluster.v"

module kmeancluster_tb();
    reg clk, reset;
    
    kmeancluster obj(clk, reset);
    
    initial
    begin
        reset = 1;
        clk   = 1;
        #1
        reset = 0;
        #1
        reset = 1;
        
        $dumpfile("kmeancluster.vcd");
        $dumpvars(0, kmeancluster_tb);
    end
    
    always // to generate clock
    begin
    #5
    clk = !clk;
    end
endmodule
