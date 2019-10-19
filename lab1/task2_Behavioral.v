
module Task2(in1,in2,in3,in4,o1,o2,o3,o4);
input  in1,in2,in3,in4;
output o1,o2,o3,o4;
reg o1,o2,o3,o4;
always@(in1,in2,in3,in4)
begin
 o1 = in1;
 o2 =in1^in2;
 o3 = in2^in3;
 o4 =in3^in4;
end
endmodule
