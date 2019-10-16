`include "task1.v"
`include "task2.v"

module task3(a,
             b,
             c,
             d,
             e,
             f,
             g,
             h,
             s0,
             s1,
             s2,
             out);
    input a, b, c, d, e, f, g, h, s0, s1, s2;
    output out;
    wire out0,out1;
    
    task2 obj0(a,b,c,d,s0,s1,out0);
    task2 obj1(e,f,g,h,s0,s1,out1);
    task1 obj2(out0,out1,s2,out);
endmodule
