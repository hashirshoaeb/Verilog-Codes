// Write RTL Verilog Code to implement Multiply Accumulator (MAC) architecture. The design implements the following:
// 𝐴𝑐𝑐 = 𝐴 ∗ 𝐵 + 𝐶 ∗ 𝐷 + 𝐴𝑐𝑐
// The signals A, B, C, D and Acc are 8, 8, 8, 8 and 32-bit wide unsigned numbers respectively. Verify your logic using a stimulus.

module mac(A,
           B,
           C,
           D,
           clk,
           reset,
           Acc);
    
    input [7:0]A, B, C, D;
    input clk, reset;
    output [31:0] Acc;
    reg [31:0] Acc;
    
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
            Acc <= 0;
        else
            Acc <= A * B + C * D + Acc;
    end
endmodule
