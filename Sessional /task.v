module task(in1,
            in2,
            out);
    
    input signed [N-1:0] in1, in2;
    output reg signed [N-1:0] out;
    parameter N = 8;
    always@(in1, in2)
    begin
        out = in1 + in2;
        
        if (in1 > 0 && in2 > 0 && out < 0)
            out = {0 , {N-1{1}}};
        else if (in1 < 0 && in2 < 0 && out > 0)
            out = {1 , {N-1{0}}};
        else
            out = in1 + in2;
    end
    
endmodule
    
    
