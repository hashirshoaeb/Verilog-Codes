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
    
    // Data register
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            R <= 4'b0011;
        end
        else
        begin
            case(sel_Rk)
                0: R[0]       <= Rk;
                1: R[1]       <= Rk;
                2: R[2]       <= Rk;
                default: R[3] <= Rk;
            endcase
        end
    end
    
    
endmodule
