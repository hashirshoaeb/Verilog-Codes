// Write RTL VERILOG code to implement the design shown below. Also design a stimulus to verify your RTL code of the design.
// Assume all inputs as 3 bit wide and output
// as 6 bit wide.
module mux2x1(a,
              b,
              select,
              out);
    input [5:0]a, b;
    input select;
    output [5:0]out;
    reg [5:0]out;
    // making 6 bit mux because max data size is 6 bit.
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
        reg [5:0]t1, t2;
        wire [5:0]wmux1, wmux2, wmux3, wmux4, t3;
        // mux2x1(a, b, select, out);
        mux2x1 mux1(x1, t1, ant, wmux1);
        mux2x1 mux2(x2, t2, ant, wmux2);
        assign t3 = wmux1 + wmux2;
        
        mux2x1 mux3(a1, a2, ant, wmux3);
        mux2x1 mux4(x3, t3, ant, wmux4);
        assign y = wmux3 * wmux4;
        
        always@(posedge clk, negedge reset)
        begin
            if (reset == 0)
            begin
                t1 <= 0;
                t2 <= 0;
            end
            else
            begin
                t1 <= t3;
                t2 <= y;
            end
        end
    endmodule
        // Todo: test bench left, how 3bit, will go to 6bit wire.
