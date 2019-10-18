`include "mac.v"

module mac_tb();
    reg [7:0]A, B, C, D;
    reg clk, reset;
    wire [31:0] Acc;
    
    // mac(A, B, C, D, clk, reset, Acc);
    mac obj(A, B, C, D, clk, reset, Acc);
    
    initial
    begin
        $dumpfile("mac.vcd");
        $dumpvars(0, mac_tb);
        $display("done testing case %d", Acc);
        A = 2; B = 2; C = 2; D = 2; clk = 0; reset = 0;
        #10
        reset = 1;
        #10
        A = 3; B = 3; C = 3; D = 3;
        #10
        $finish();
    end
    
    always // to generate clock
    begin
    #5
    clk = !clk;
    end
endmodule
