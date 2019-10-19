// Write RTL VERILOG code to implement the design shown below. Also design a stimulus to verify your RTL code of the design. Assume all inputs as 3 bit wide and output as 6 bit wide.
module mux2x1(a,
              b,
              select,
              out);
    input [2:0]a, b;
    input select;
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
    
    module question3(x1,
        x2,
        x3,
        a1,
        a2,
        ant,
        clk,
        reset,
        y);
        input [2:0]x1, x2, x3, a1, a2, ant;
        input clk, reset;
        output [5:0]y;
        
        always@(posedge clk, negedge reset)
        begin
            if (reset == 0)
            else
        end
    endmodule
