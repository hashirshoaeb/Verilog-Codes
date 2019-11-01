`include "Question2.v"

module Question2_tb();
    reg [3:0]x;
    reg clk, reset;
    wire [3:0]y;
    
    Question2 obj(x, clk, reset, y);
    
    initial
    begin
        $dumpfile("Question2.vcd");
        $dumpvars(0, Question2_tb);
        $display("done testing case %d", y);
        x = 0; reset = 0; clk = 0;
        #10
        x = 0; reset = 1;
        #10
        x = 1;
        #10
        x = 2;
        #10
        x = 3;
        #10
        $finish;
    end
    
    always // to generate clock
    begin
    #5
    clk = !clk;
    end
endmodule
