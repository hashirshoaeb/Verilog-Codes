module ALU(clk,
           reset,
           sel_Ri,
           sel_Rj,
           sel_Rk,
           sel_op,
           seg_7);
    //parameter N = 4;
    input clk, reset;
    input [1:0] sel_Ri, sel_Rj, sel_Rk, sel_op;
    output reg [6:0] seg_7; //[abcdefg]
    reg [2:0] Rk, Ri, Rj;
    reg [2:0] R [3:0];
    
    // Data register
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            R[0] <= 4'b0011;
            R[1] <= 4'b0101;
            R[2] <= 4'b1001;
            R[3] <= 4'b0001;
        end
        else
        begin
            R[sel_Rk] <= Rk;
        end
    end
    
    // selecting Ri
    always@(sel_Ri)
    begin
        Ri <= R[sel_Ri];
    end
    
    // selecting Rj
    always@(sel_Rj)
    begin
        Rj <= R[sel_Rj];
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
    
    // 7 segment display
    always@(Rk)
    begin
        case(Rk)
            0: seg_7       = 7'b0000001;
            1: seg_7       = 7'b1001111;
            2: seg_7       = 7'b0010010;
            3: seg_7       = 7'b0000110;
            4: seg_7       = 7'b1001100;
            5: seg_7       = 7'b0100100;
            6: seg_7       = 7'b0100000;
            7: seg_7       = 7'b0001111;
            8: seg_7       = 7'b0000000;
            9: seg_7       = 7'b0001100;
            default: seg_7 = 7'b1111111;
            
        endcase
    end
endmodule
