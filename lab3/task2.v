// `include "task1.v"  // to run task2 uncomment it, to run task3 comment it.
module task2(a,
             b,
             c,
             d,
             select0,
             select1,
             out);
    input a, b, c, d, select0, select1;
    output out;
    wire out, out0, out1;
    
    task1 obj0(a,b,select0,out0);
    task1 obj1(c,d,select0,out1);
    task1 obj2(out0,out1,select1,out);
    
endmodule
