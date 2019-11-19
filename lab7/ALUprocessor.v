module ALU(clk,
           reset,
           sel_Ri,
           sel_Rj,
           sel_Rk,
           sel_op);
    //parameter N = 4;
    input clk, reset;
    input [1:0] sel_Ri, sel_Rj, sel_Rk, sel_op;
    reg Rk, Ri, Rj;
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
    
    // selecting Ri
    always@(sel_Ri)
    begin
        case(sel_Ri)
            0: Ri      <= R[0];
            1: Ri      <= R[1];
            2: Ri      <= R[2];
            default:Ri <= R[3];
        endcase
    end
    
    // selecting Rj
    always@(sel_Rj)
    begin
        case(sel_Rj)
            0: Rj      <= R[0];
            1: Rj      <= R[1];
            2: Rj      <= R[2];
            default:Rj <= R[3];
        endcase
    end
    
    // selecting operator
    always@(sel_op)
    begin
        case(sel_op)
            0: Rk       <= Ri + Rj;
            1: Rk       <= Ri - Rj;
            2: Rk       <= Ri & Rj;
            default: Rk <= Ri | Rj;
        endcase
    end
endmodule
