module dummy(in1,in2,in3,o1,o2)
input in1,in2,in3;
output o1;
reg o1;
output [3:0] o2;
reg o2;
reg s1;
reg s2;
reg c1;
always@(in1,in2,in3)
begin
s1=in1^in2;
c1=in1*in2;
s2=s1*in3;
o1=in3^s1;
o2=s2^in3;
end
endmodule

