module get_Index(clk,i,j,l0,l1,l2,l3,l4,l5,l6,l7,l8);
    input clk;
    input [5:0] i, j;
    output reg [11:0] l0,l1,l2,l3,l4,l5,l6,l7,l8;
    parameter n = 64;
    reg k;
    always@(posedge clk)
    begin
        k = 0 + (i * n);
        l0 = k - n + j - 1;
        l1 = k - n + j;
        l2 = k - n + (j + 1);
        l3 = k + (j - 1);
        l4 = k + j;
        l5 = k + (j + 1);
        l6 = k + n + (j - 1);
        l7 = k + n + j;
        l8 = k + n + (j + 1);
        $monitor("%0d", l0, l1, l2, l3, l4, l5, l6, l7,l8);
    end
endmodule