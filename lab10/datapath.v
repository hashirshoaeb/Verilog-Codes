module pattern_comparator(pattern,
                          clk,
                          rst,
                          start);
    input [3:0] pattern;
    input clk, start, rst;
    output count; // set size
    
    // initializing ROM
    reg [7:0] ROM_IN [0:15];
    initial
    begin
        ROM[0]  = 8'b00000000;
        ROM[1]  = 8'b00000001;
        ROM[2]  = 8'b00000010;
        ROM[3]  = 8'b00000100;
        ROM[4]  = 8'b00001000;
        ROM[5]  = 8'b00010000;
        ROM[6]  = 8'b00100000;
        ROM[7]  = 8'b01000000;
        ROM[8]  = 8'b10000000;
        ROM[9]  = 8'b00100100;
        ROM[10] = 8'b01001000;
        ROM[11] = 8'b10010000;
        ROM[12] = 8'b00000110;
        ROM[13] = 8'b00001100;
        ROM[14] = 8'b00011000;
        ROM[15] = 8'b00110000;
    end
    
    // Address counter
    reg [3:0] Address;
    reg A;
    always@(posedge clk, negedge rst)
    begin
        if (rst == 0)
            Address = 0;
        else
            Address = Address + A;
    end
    
    // selecting value at address
    reg [7:0] R;
    always(*)
    begin
        R = ROM[Address];
    end
    
    // State machine
    reg [2:0] sel;
    FSM obj(Address, M, start, A, sel);
    
    // selecting 4 bits to comapare
    reg [3:0] x;
    always@(sel)
    begin
        if (sel == 0)
            x = R[3:0];
        else if (sel == 1)
            x = R[4:1];
        else if (sel == 2)
            x = R[5:2];
        else if (sel == 3)
            x = R[6:3];
        else
            x = R[7:4];
    end
    
    // comparing
    wire M;
    assign M = (x == pattern);
    
    // count number of detceted patterns
    always@(posedge clk, negedge rst)
    begin
        if (rst == 0)
            count <= 0;
        else
            count <= count + M
    end
    
endmodule
    
    module FSM(Address, M, start, A, sel);
        
    endmodule
