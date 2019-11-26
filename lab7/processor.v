`include "ALU.v"
module processor(clk,
                 reset,
                 seg7);
    
    input clk, reset;
    output [6:0]seg7;
    reg [7:0] ROM [0:15];
    reg [3:0] p_count;
    reg [24:0] counter;
    reg [7:0] IR;
    wire my_clk;
    // ROM
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
    
    // Clk
    assign my_clk = (counter > 15000000);
    // Counter
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            p_count <= 0;
            counter <= 0;
        end
        else
        begin
            if (counter <= 30000000)
                counter = counter + 1;
            else
            begin
                counter = 0;
                p_count = p_count + 1;
            end
        end
    end
    
    // Decode
    reg [1:0] sel_Ri, sel_Rj, sel_Rk, sel_op;
    always@(p_count)
    begin
        IR <= ROM[p_count];
        sel_op = IR[7:6];
        sel_Rk = IR[5:4];
        sel_Ri = IR[3:2];
        sel_Rj = IR[1:0];
    end
    // calling ALU
    ALU obj(my_clk, reset, sel_Ri, sel_Rj, sel_Rk, sel_op, seg7);
    
endmodule
