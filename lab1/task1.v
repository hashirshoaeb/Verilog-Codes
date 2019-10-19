
module Task1(in1,in2,in3,o1,o2 );
  input  in1,in2,in3;
  output o1,o2;
  wire   w1,w2,w3;
  assign w1=in1^in2;
  assign w2 = w1&in3;
  assign w3 = in1 & in2;
  assign o1 = w1 ^ in3;
  assign o2 = w2 ^ w3;
 endmodule
