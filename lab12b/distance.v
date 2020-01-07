module distance(data,
                mean,
                dist);
    input [15:0]data;
    input [15:0]mean;
    output wire [7:0]dist;
    
    wire signed [7:0] c , d;
    reg [7:0] cnew, dnew;
    assign c = data[15:8] - mean[15:8];
    assign d = data[7:0] - mean[7:0];
    
    always@(*)
    begin
        if (c < 0)
            cnew = ~c + 1;
        else
            cnew = c;
        
        if (d < 0)
            dnew = ~d + 1;
        else
            dnew = d;
    end
    
    assign dist = cnew + dnew;
endmodule
