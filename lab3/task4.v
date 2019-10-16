module mux16b_2x1(a,
                  b,
                  select,
                  out);
    input [15:0]a, b;
    input select;
    output [15:0]out;
    reg [15:0]out;
    
    always@(a, b, select)
    begin
        if (select == 0)
            out = a;
        else
            out = b;
    end
endmodule
    
    module task4(in, clk, reset, sel_12, sel_3, out); // Write RTL VERILOG code for the following circuit. Test your design for all values of in.
        input [15:0]in;
        input clk, reset, sel_12, sel_3;
        output [15:0]out;
        reg [15:0]out, reg_a, reg_b;
        wire [15:0]mux_out_1, mux_out_2, mux_out_3, sum_out, sub_out;
        
        mux16b_2x1 obj0(reg_a, reg_b, sel_12, mux_out_1);
        mux16b_2x1 obj1(reg_a, reg_b, sel_12, mux_out_2);
        assign sum_out = mux_out_1 + mux_out_2;
        assign sub_out = mux_out_1 - mux_out_2;
        mux16b_2x1 obj2(sum_out, sub_out, sel_3, mux_out_3);
        
        always@(posedge clk, negedge reset)
        begin
            if (reset == 0)
            begin
                out   <= 0;
                reg_a <= 0;
                reg_b <= 0;
            end
            else
            begin
                reg_a <= in;
                reg_b <= out;
                out   <= mux_out_3;
            end
        end
    endmodule
