module tb_fa();
 	
	reg a, b, Cin;
	wire sum, Cout;
	full_adder obj ( .a(a), .b(b), .Cin(Cin), .sum(sum), .Cout(Cout));
    	initial begin
        //Inputs
        a = 0;	    b = 0;	Cin = 0;      #100;  
        a = 0;      b = 0;      Cin = 1;      #100;
        a = 0;      b = 1;      Cin = 0;      #100;
        a = 0;      b = 1;      Cin = 1;      #100;
        a = 1;      b = 0;      Cin = 0;      #100;
        a = 1;      b = 0;      Cin = 1;      #100;
        a = 1;      b = 1;      Cin = 0;      #100;
        a = 1;      b = 1;      Cin = 1;      #100;
    end
      
endmodule

module tb_rca ();
 
	reg [3:0] a, b;
	wire [3:0] sum;
	wire Cout;
	integer i,j;
	ripple_adder obj_01 ( .a(a), .b(b), .sum(sum), .Cout(Cout));
	initial begin
	// Inputs
	a = 0; b = 0;
	#50
	for (i = 0; i < 16; i=i+1)	//a
	begin
	for (j = 0; j < 16; j=j+1)	//b
	begin
	a = i;	b = j;	#10;
     end	// loop 02
     end	// loop 01
end	// initial


 
endmodule // ripple_carry_adder_tb

module full_adder(a, b, Cin, sum, Cout);

	input a, b, Cin;
	output sum, Cout;
	reg sum, Cout, t1, t2, t3, t4, t5, t6;

	always @(*)
	begin

	t1 = a ^ b;
	t2 = a & b;
	t3 = ~t2;
	t4 = t1 & Cin;
	t5 = ~t4;
	sum = t1 ^ Cin;
	t6 = t3 & t5;
	Cout = ~t6;
	end 


endmodule 


module ripple_adder(a, b, sum, Cout);
 input [3:0] a, b;// Two 4-bit inputs
 output [3:0] sum;
 output Cout;
 wire w1, w2, w3;

 full_adder obj_01(a[0], b[0], 1'b0, sum[0], w1);
 full_adder obj_02(a[1], b[1], w1, sum[1], w2);
 full_adder obj_03(a[2], b[2], w2, sum[2], w3);
 full_adder obj_04(a[3], b[3], w3, sum[3], Cout);

endmodule
