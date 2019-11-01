`include "Question3.v"

module Question3_tb();
    reg clk, x;
    wire y1, y2;
    
    my_unit obj(clk, x, y1, y2);
    
    initial
    begin
        $dumpfile("Question3.vcd");
        $dumpvars(0, Question3_tb);
        $display("done testing case %d", y1);
        clk = 0; x = 0;
        #10
        clk = 1;
        #10
        clk = 0;
        #10
        clk = 1; x = 1;
        #10
        clk = 0;
        #10
        clk = 1;
        #10
        clk = 0;
        #10
        clk = 1; x = 0;
        #10
        clk = 0;
        #10
        clk = 1; x = 1;
        #10
        clk = 0;
        #10
        clk = 1; x = 0;
        #10
        clk = 0;
        #10
        $finish;
    end
endmodule
