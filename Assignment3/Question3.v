// Q3: Complete the waveform for the given logic

module my_unit(clk,
               x,
               y1,
               y2);
    input clk, x;
    output y1, y2;
    reg y1, y2;
    wire w;
    
    assign w = x|(~y1);
    always@(posedge clk)
    begin
        y2 <= w;
    end
    
    always@(negedge clk)
    begin
        y1 <= y2;
    end
endmodule
