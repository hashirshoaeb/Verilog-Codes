module tb_t03();

	reg clk, rst_n, sel;
	reg [2:0] x1, x2, a1, a2, a3;
	wire  [2:0] Y;
	integer i, j, k, l, m; 
	task_03 obj_01 (.x1(x1), .x2(x2), .a1(a1), .a2(a2), .a3(a3), .clk(clk), .rst_n(rst_n), .Y(Y), .sel(sel));
	initial begin 
	clk  = 0;	rst_n = 0;	sel = 0;
	x1 = 0; x2 = 0; a1 = 0; a2 = 0; a3 = 0;
	#10
	for (i = 0; i < 8; i=i+1)	//x1
	begin
	for (j = 0; j < 8; j=j+1)	//x2
	begin
	for (k = 0; k < 8; k=k+1)	//a1
	begin
	for (l = 0; l < 8; l=l+1)	//a2
	begin
	for (m = 0; m < 8; m=m+1)	//a3
	begin
	x1 = i;	x2 = j;	a1 = k;	a2 = l;	a3 = m;	#10;
	end	// loop 05
	end	// loop 04
	end	// loop 03
	end	// loop 02
	end	// loop 01
	end	// initial

	always
	#5 clk = !clk;
	always
	#10 rst_n = !rst_n;
	always
	#20 sel = !sel;
      
endmodule

module mux2to1(a, b, sel, Data_out);

    input [2:0] a;
    input [2:0] b;
    input sel;

    output [2:0] Data_out;
    //Internal variables.
    reg [2:0] Data_out, t1, t2, t3;

   always @(a, b, sel, t1, t2, t3)
    begin
       t1 = a & sel;
       t2 = ~sel;
       t3 = b & t2;
       Data_out = t1 | t3; 

    end
    
endmodule


module task_03(x1, x2, a1, a2, a3, clk, rst_n, Y, sel);

	input clk, rst_n, sel;
	input [2:0] x1, x2, a1, a2, a3;
	output [2:0] Y;
	wire [2:0] t1, t2, t4, t5, x3;
	reg [2:0] x4, x5;
	wire [2:0] t3;	wire [5:0] Y;

	mux2to1 obj_01 (.a(x1), .b(x4), .sel(sel), .Data_out(t1));	// mux 01 ..output = t1
	mux2to1 obj_02 (.a(x2), .b(x5), .sel(sel), .Data_out(t2));	// mux 02 ..output = t2
	mux2to1 obj_03 (.a(a1), .b(a2), .sel(sel), .Data_out(t4));	// mux 03 ..output = t4
	mux2to1 obj_04 (.a(a3), .b(x3), .sel(sel), .Data_out(t5));	// mux 04 ..output = t5

assign  t3 = t1 + t2;
assign  x3 = t3;
assign   Y = t4 * t5;

	always @(posedge clk, negedge rst_n)
	begin
	if (rst_n == 0)
	begin 
	x4 <= 0;	x5 <= 0;	
	end
	else begin
	x4 <= t3;	x5 <= Y;
	end
	end
endmodule
