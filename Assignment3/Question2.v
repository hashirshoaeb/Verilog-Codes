// Q2: Exercise question 2.10. Provide an RTL diagram and its relevant code; also test your code using a stimulus. Keep the input and output bit size equal to 4 bits.
// y[n] = x[n] - x[n-1] + x[n-2] + x[n-3] + 0.5y[n-1] + 0.25y[n-2]

module Question2(x,
                 clk,
                 reset,
                 y);
    input x;
    input clk, reset;
    output y;
    reg x1, x2, x3, y1, y2;
    
    assign y = x - x1 + x2 + x3 + (y1 >> 1) + (y2 >> 2);
    always@(posedge clk, negedge reset)
        if (reset == 0)
        begin
            x1 <= 0; x2 <= 0; x3 <= 0; y1 <= 0; y2 <= 0;
        end
        else
        begin
            x1 <= x;
            x2 <= x1;
            x3 <= x2;
            y1 <= y;
            y2 <= y1;
        end
endmodule
