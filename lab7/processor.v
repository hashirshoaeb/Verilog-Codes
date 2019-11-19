module processor(clk,
                 reset,
                 seg7);
    
    input clk, reset;
    output [6:0]seg7;
    reg [7:0] ROM [0:15];
    
endmodule
