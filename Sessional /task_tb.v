`include "task.v"

module task_s_tb();
    reg signed [7:0] in1, in2;
    wire reg signed [7:0] out;
    
    task_s  obj(in1, in2, out);
    initial
    begin
        $dumpfile("task.vcd");
        $dumpvars(0, task_s_tb);
        $monitor("done testing case %d ,  %d,  %d", out, in1, in2);
        // numbers in range
        // 8 bit signed range in decimal is [127 to -128]
        in1 = 8'b00000011; // 3
        in2 = 8'b00000011; // 3
        // out is 6
        #10
        in1 = 8'b10000001; // -127
        in2 = 8'b10000000; // -128
        // out should be -225 which is out of range.
        // so giving min number which is -128
        #10
        in1 = 8'b01100001; // 97
        in2 = 8'b01100000; // 96
        // out should be 193 which is out of range.
        // so giving max number which is 127
        #10
        $finish;
    end
    
endmodule
