`include "FullAdder_4b.v"

module FullAdder_4b_tb();
    reg A0, A1, A2, A3, B0, B1, B2, B3, Cin;
    wire Sum0, Sum1, Sum2, Sum3, Cout3;
    
    FullAdder_4b obj(A0, A1, A2, A3, B0, B1, B2, B3, Cin, Sum0, Sum1, Sum2, Sum3, Cout3);
    initial
    begin
        $dumpfile("FullAdder_4b.vcd");
        $dumpvars(0, FullAdder_4b_tb);
        $display("done testing case %d", Cout3);
        // 0000 + 0000 = 0000
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; B0 = 0; B1 = 0; B2 = 0; B3 = 0; Cin = 0;
        #10
        // 0001 + 0001 = 0010
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; B0 = 1; B1 = 0; B2 = 0; B3 = 0; Cin = 0;
        #10
        //1111 + 0001 = (cout3 = 1) 0000
        A0 = 1; A1 = 1; A2 = 1; A3 = 1; B0 = 1; B1 = 0; B2 = 0; B3 = 0; Cin = 0;
        #10
        //A0 = 1; A1 = 0; A2 = 0; A3 = 0; B0 = 1; B1 = 0; B2 = 0; B3 = 0; Cin = 0;
        $finish;
    end
endmodule
