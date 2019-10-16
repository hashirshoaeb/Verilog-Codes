`include "task2.v"
module task2_tb();
    reg [3:0]x0 ,h0, h1, h2;
    reg clk, reset;
    wire [7:0]y;
    
    task2 obj(x0, h0, h1, h2, clk, reset, y);
    initial
    begin
        $dumpfile("task2.vcd");
        $dumpvars(0, task2_tb);
        $display("done testing case %d", y);
        clk = 0; reset = 0; x0 = 0; h0 = 1; h1 = 2; h2 = 1;
        #10
        reset = 1;
        #10
        x0 = 1;
        #10
        x0 = 2;
        #10
        x0 = 3;
        #10
        x0 = 4;
        #10
        x0 = 5;
        $finish;
    end
    
    always
    begin
    #5
    clk = !clk;
    end
endmodule
