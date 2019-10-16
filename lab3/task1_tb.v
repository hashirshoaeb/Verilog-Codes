`include "task1.v"

module task1_tb();
    reg a,b, select;
    wire out;
    
    task1 obj(a,b,select,out);
    
    initial
    begin
        $dumpfile("task1.vcd");
        $dumpvars(0, task1_tb);
        $display("done testing case %d", out);
        a = 0; b = 0; select = 0;
        #10
        a = 0; b = 1; select = 0;
        #10
        a = 0; b = 1; select = 1;
        #10
        a = 1; b = 1; select = 1;
        #10
        a = 1; b = 0; select = 1;
        #10
        $finish;
    end
endmodule
