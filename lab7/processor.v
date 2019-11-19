module processor(clk,
                 reset,
                 seg7);
    
    input clk, reset;
    output [6:0]seg7;
    reg [7:0] ROM [0:15];
    
    initial
    begin
        ROM[0]  = 8'b00000000;
        ROM[1]  = 8'b00000000;
        ROM[2]  = 8'b00000000;
        ROM[3]  = 8'b00000000;
        ROM[4]  = 8'b00000000;
        ROM[5]  = 8'b00000000;
        ROM[6]  = 8'b00000000;
        ROM[7]  = 8'b00000000;
        ROM[8]  = 8'b00000000;
        ROM[9]  = 8'b00000000;
        ROM[10] = 8'b00000000;
        ROM[11] = 8'b00000000;
        ROM[12] = 8'b00000000;
        ROM[13] = 8'b00000000;
        ROM[14] = 8'b00000000;
        ROM[15] = 8'b00000000;
    end
    
endmodule
