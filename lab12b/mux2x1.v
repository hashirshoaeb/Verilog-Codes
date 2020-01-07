module mux2x1(a,
              b,
              select,
              out);
    input [7:0] a, b;
    input select;
    output [7:0]out;
    reg [7:0]out;
    
    always@(a, b, select)
    begin
        if (select == 0)
            out = a;
        else
            out = b;
    end
endmodule
