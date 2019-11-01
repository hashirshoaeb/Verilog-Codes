`include "Question1.v"

module Question1_tb();
    reg [3:0]data;
    reg clk, reset;
    wire [7:0]out;
    
    Question1 obj(data, clk, reset, out);
    initial
    begin
        $dumpfile("Question1.vcd");
        $dumpvars(0, Question1_tb);
        $display("done testing case %d", out);
        data = 0; reset = 0; clk = 0;
        #10
        data = 0; reset = 1;
        #10
        data = 1;
        #10
        data = 2;
        #10
        data = 3;
        #10
        $finish;
    end
    
    always // to generate clock
    begin
    #5
    clk = !clk;
    end
endmodule
