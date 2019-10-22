// Write RTL VERILOG Code to implement the logic shown in figure 1 representing a full adder where A, B are 1 bit input whereas Cin 1 bit carry. Write another module for implementing a 4- bit adder, use “module for figure-1” to implement the four bit adder shown in figure 2. Write a stimulus to test the 4-bit adder.
module FullAdder_1b(A,
                    B,
                    Cin,
                    Sum,
                    Cout);
    input A, B, Cin;     // 1bit inputs
    output Sum, Cout;   // 1bit output
    
    assign Sum  = (A ^ B) ^ Cin;
    assign Cout = ~(~(Cin & (A ^ B)) & ~(A & B));
    
endmodule
    // Operator	Type
    // &	    And
    // ~&	    Nand
    // |	    Or
    // ~|	    Nor
    // ^	    Xor
    // ~^	    Xnor
    
    
