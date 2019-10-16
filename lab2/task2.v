module task2(x0,
             h0,
             h1,
             h2,
             clk,
             reset,
             y);
    input [3:0]x0 ,h0, h1, h2;
    input clk, reset;
    output [7:0]y;
    
    reg [3:0]x1, x2;
    wire [7:0] w0, w1, w2, w01;
    
    assign w0  = x0 * h0;
    assign w1  = x1 * h1;
    assign w2  = x2 * h2;
    assign w01 = w0 + w1;
    assign y   = w01 +w2;
    
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            x1 <= 0;
            x2 <= 0;
        end
        else
        begin
            x1 <= x0;
            x2 <= x1;
        end
    end
endmodule
