module tb_MAC();

	reg clk, rst_n;
	reg [7:0] a, b, c, d;
	wire Acc;
	integer i, j, k, l;
	MAC obj ( .a(a), .b(b), .c(c), .d(d), .Acc(Acc), .clk(clk), .rst_n(rst_n));
    	initial begin
        //Inputs
   	clk  = 0;	rst_n = 0;
	a = 0; b = 0; c = 0; d = 0;
	#50
	for (i = 0; i < 256; i=i+1)	//a
	begin
	for (j = 0; j < 256; j=j+1)	//b
	begin
	for (k = 0; k < 256; k=k+1)	//c
	begin
	for (l = 0; l < 256; l=l+1)	//d
	begin
	a = i;	b = j;	c = k;	d = l;	#2;
	end	// loop 04
	end	// loop 03
	end	// loop 02
	end	// loop 01
	end	// initial

	always
	#5 clk = !clk;
	always
	#10 rst_n = !rst_n;

      
endmodule


module MAC (a, b, c, d, Acc, clk, rst_n);
	
	input clk, rst_n;
	input [7:0] a, b, c, d;
	output [31:0] Acc;
	wire [7:0]t1, t2;
	reg [31:0] Acc;
	
assign  t1 = a * b;
assign  t2 = c * d;

	always @(posedge clk, negedge rst_n)
	begin
	if (rst_n == 0)
	begin 
	Acc <= 0;
	end
	else begin
	Acc <= t1 + t2 + Acc;
	end
	end
endmodule
