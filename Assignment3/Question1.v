// Q1: Design a datapath with three 8 bit accumulators. The first accumulator, acc1, adds a 4 bit input data in acc1 in every clock cycle. The second accumulator, acc2, adds the first accumulator in itself, and the third accumulator, acc3, adds the first and second accumulators in itself in every clock cycle. Each accumulator has an asynchronous reset. Draw the RTL level diagram and code the design in RTL Verilog.

module Question1(data,
                 clk,
                 reset,
                 out);
    input [3:0]data;
    input clk, reset;
    output [7:0]out;
    wire sum1, sum2;
    reg [7:0]acc1, acc2, acc3;
    
    assign sum1 = data + acc1;
    assign sum2 = sum1 + acc2;
    assign out  = sum1 + sum2 + acc3;
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            acc1 <= 0;
            acc2 <= 0;
            acc3 <= 0;
        end
        else
        begin
            acc1 <= sum1;
            acc2 <= sum2;
            acc3 <= out;
        end
    end
    
endmodule
