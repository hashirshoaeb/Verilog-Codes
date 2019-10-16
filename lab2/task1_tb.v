// `timescale 1ns/100ps
`include "task1.v"
module task1_tb(); // test bench has no port(parameter)
    reg clk, reset; // 1 bit register
    reg [3:0]data; // 4 bit register for input
    
    wire [7:0]acc_reg; // 8 bit wire for output
    
    task1 obj(clk, reset, data, acc_reg); // 4 ports
    initial // runs at time 0
    begin
        $dumpfile("task1.vcd");
        $dumpvars(0, task1_tb);
        $display("done testing case %d", data);
        clk = 0; reset = 0; data = 0; // initilize reset to zero first for feedback systems.
        #10 // delay of 10 time units
        reset = 1;
        #10
        data = 1;
        #10
        data = 2;
        #10
        data = 3;
        #10
        data = 4;
        #10
        data = 5;
        $finish; // to end similation otherwise clock will take it to infinite loop
    end
    
    always // to generate clock
    begin
    #5
    clk = !clk;
    end
    
endmodule
