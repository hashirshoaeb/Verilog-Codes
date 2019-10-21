module ALU(a, b, sel, out);
    input [3:0] a, b;	// ALU 4-bit Inputs                 
    input [2:0] sel;	// ALU Selection
    output [4:0] out;	// ALU 5-bit Output

    reg [4:0] out;

  

    always @(*)
    begin
        case(sel)
	3'b000: // A
		out = a;
        3'b001: // Addition
        	out = a + b ; 
        3'b010: // Subtraction
        	out = a - b ;
        3'b011: // Division
        	out = a/b;
	3'b100: // Remainder
        	out = a % b;
        3'b101: // Logical shift left
        	out = a<<1;
        3'b110: // Logical shift right
        	out = a>>1;
        3'b111: // Greater comparison
        	out = (a>b)?8'd1:8'd0 ;
        default: out = a * b ; 
        endcase
    end

endmodule





