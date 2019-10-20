// Define a module to design an 8-function ALU that takes two 4-bit numbers a and b and computes a 5-bit result out based on a 3-bit select signal. Ignore overflow or underflow bits.
// Select Signal    Function Output
// 3'b000           a
// 3'b001           a +b
// 3'b010           a -b
// 3'b011           a /b
// 3'b100           a % b (remainder)
// 3'b101           a << 1
// 3'b110           a >> 1
// 3'b111           (a > b) (magnitude compare)

module ALU(a,
           b,
           select,
           out);
    input [3:0]a, b;
    input [2:0]select;
    output [4:0]out;
    reg [4:0]out;
    
    always@(a, b, select)
        if (select == 0)
            out = a;
        else if (select == 1)
            out = a + b;
        else if (select == 2)
            out = a - b;
        else if (select == 3)
            out = a / b;
        else if (select == 4)
            out = a % b;
        else if (select == 5)
            out = a << 1;
        else if (select == 6)
            out = a >> 1;
        else
            out = a > b;
endmodule
