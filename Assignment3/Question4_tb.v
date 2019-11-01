`include "Question4.v"

module Question4_tb();
    reg[3:0] num;
    wire[6:0] out;
    
    Question4 obj(num, out);
    initial
    begin
        $dumpfile("Question4.vcd");
        $dumpvars(0, Question4_tb);
        $display("done testing case %d", out);
        num = 0;
        #10
        num = 1;
        #10
        num = 2;
        #10
        num = 3;
        #10
        num = 4;
        #10
        num = 5;
        #10
        num = 6;
        #10
        $finish;
    end
    
endmodule
