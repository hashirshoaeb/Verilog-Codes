`include "FullAdder_1b.v"
module FullAdder_4b(A0,
                    A1,
                    A2,
                    A3,
                    B0,
                    B1,
                    B2,
                    B3,
                    Cin,
                    Sum0,
                    Sum1,
                    Sum2,
                    Sum3,
                    Cout3);
    input A0, A1, A2, A3, B0, B1, B2, B3, Cin;     // 1bit inputs
    output Sum0, Sum1, Sum2, Sum3, Cout3;   // 1bit output
    wire Cout0, Cout1, Cout2;
    // FullAdder_1b(A, B,Cin,Sum,Cout);
    FullAdder_1b obj0(A0, B0, Cin, Sum0, Cout0);
    FullAdder_1b obj1(A1, B1, Cout0, Sum1, Cout1);
    FullAdder_1b obj2(A2, B2, Cout1, Sum2, Cout2);
    FullAdder_1b obj3(A3, B3, Cout2, Sum3, Cout3);
    
endmodule
