module ALU(clk,
           reset,
           sel_Ri,
           sel_Rj,
           sel_Rk,
           sel_op);
    //parameter N = 4;
    input clk, reset;
    input [1:0] sel_Ri, sel_Rj, sel_Rk, sel_op;
    wire Rk, Ri, Rj;
    reg [3:0]R;
    
    
endmodule
