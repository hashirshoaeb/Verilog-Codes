module multiplier(in1,
                  in2,
                  out);
    
    parameter               N = 3;
    input  [N-1 : 0]        in1;
    input  [N-1 : 0]        in2;
    output reg [N + N - 1 : 0]  out;
    
    reg    [N + N - 1 : 0]  partialProduct;
    reg 	 [N + N - 1 : 0]  tempPartialProduct;
    reg 	 [N + N - 1 : 0]  temp;
    // I'm gonna multiply it yeah
    integer i = 0;
    always@(*)
    begin
        temp           = 0;
        partialProduct = 0;
        for (i = 0; i < N; i = i+1)
        begin
            partialProduct     = {{N{in2[i] & in1[N-1]}} , in1 & { N{in2[i]}}};
            tempPartialProduct = partialProduct << i;
            temp               = temp + tempPartialProduct;
        end
        out = temp;
    end
endmodule
