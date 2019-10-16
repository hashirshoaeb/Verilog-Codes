`include "task2.v"

module task2_tb();
    reg a, b, c, d, select0, select1;
    wire out;
    
    task2 obj(a, b, c, d, select0, select1, out);
    
    initial
    begin
        $dumpfile("task2.vcd");
        $dumpvars(0, task2_tb);
        $display("done testing case %d", out);
        a = 0; b = 0; c = 0; d = 0; select0 = 0; select1 = 0; // out 0th
        #10
        a = 1; b = 0; c = 0; d = 0; select0 = 0; select1 = 0; // out 0th
        #10
        a = 0; b = 1; c = 0; d = 0; select0 = 0; select1 = 0; // out 0th
        #10
        a = 0; b = 0; c = 0; d = 0; select0 = 1; select1 = 0; // out 1th
        #10
        a = 0; b = 1; c = 0; d = 0; select0 = 1; select1 = 0; // out 1th
        #10
        a = 0; b = 0; c = 0; d = 1; select0 = 1; select1 = 1; // out 3rd
        #10
        $finish;
    end
endmodule
