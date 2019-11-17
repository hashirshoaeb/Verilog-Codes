module task_s(in1,
              in2,
              out);
    
    parameter N = 8;
    input signed [N-1:0] in1, in2;
    output reg signed [N-1:0] out;
    
    always@(in1, in2)
    begin
        if (in1 > 0 && in2 > 0 && out < 0)
            out <= {1'b0 , {N-1{1'b1}}};
        else if (in1 < 0 && in2 < 0 && out > 0)
            out <= {1'b1 , {N-1{1'b0}}};
        else
            out <= in1 + in2;
    end
    
endmodule
