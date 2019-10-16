module task1(a,
             b,
             select,
             out);
    input a, b, select;
    output out;
    reg out;
    
    always@(a, b, select)
    begin
        if (select == 0)
            out = a;
        else
            out = b;
    end
endmodule
