`include "ALU.v"

module ALU_tb();
    reg [3:0]a, b;
    reg [2:0]select;
    wire [4:0]out;
    
    // ALU(a, b, select, out);
    ALU obj(a, b, select, out);
    
    initial
    begin
        $dumpfile("ALU.vcd");
        $dumpvars(0, ALU_tb);
        $display("done testing case %d", out);
        a = 1; b = 0; select = 0;
        #10
        a = 5; b = 3; select = 3;
        #10
        a = 5; b = 3; select = 2;
        #10
        $finish;
    end
endmodule
