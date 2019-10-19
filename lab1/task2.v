
module Task2(in1,in2,in3,in4,o1,o2,o3,o4 );
input in1,in2,in3,in4;
output o1,o2,o3,o4;
assign o1=in1;
assign o2 = in1^in2;
assign o3 = in2^in3;
assign o4 = in3 ^ in4;
endmodule
