`include "task3.v"

module task3_tb();
    reg a, b, c, d, e, f, g, h, s0, s1, s2;
    wire out;
    
    task3 obj(a, b, c, d, e, f, g, h, s0, s1, s2, out);
    
    initial
    begin
        $dumpfile("task3.vcd");
        $dumpvars(0, task3_tb);
        $display("done testing case %d", out);
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; s0 = 0; s1 = 0; s2 = 0;
        #10
        $finish;
    end
    
endmodule
