module task1(clk,
             reset,
             data,
             acc_reg);
    input [3:0]data;
    input clk, reset;
    output [7:0]acc_reg;
    reg [7:0]Y;
    
    assign acc_reg = Y;
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            Y <= 0;
        end
        else
        begin
            Y <= acc_reg + data;
        end
    end
endmodule
    
    
    
    
