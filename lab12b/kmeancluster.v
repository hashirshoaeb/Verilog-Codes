`include "distance.v"
`include "minimum.v"
`include "mux2x1.v"
module kmeancluster(clk,
                    reset);
    
    reg [15:0] dataset [0:15];
    reg [15:0] c1, c2, c3;
    input clk, reset;
    
    initial
    begin
        c1          = 16'b0000000000000001;
        c2          = 16'b0000100000000010;
        c3          = 16'b0000000000000011;
        dataset[0]  = 16'b0000001000000010;
        dataset[1]  = 16'b0000100100000001;
        dataset[2]  = 16'b0000010000000100;
        dataset[3]  = 16'b0000000001000000;
        dataset[4]  = 16'b0000010000000000;
        dataset[5]  = 16'b0000000001010000;
        dataset[6]  = 16'b0000000000000000;
        dataset[7]  = 16'b0001000100000000;
        dataset[8]  = 16'b0000000000000000;
        dataset[9]  = 16'b0010000000000000;
        dataset[10] = 16'b0000010000010000;
        dataset[11] = 16'b0000000000001010;
        dataset[12] = 16'b0010001000010000;
        dataset[13] = 16'b0001000000000100;
        dataset[14] = 16'b0001100100000000;
        dataset[15] = 16'b0001000000010000;
    end
    
    reg [3:0] i;
    wire [15:0] ith_data;
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            i = 0;
        end
        else
        begin
            i = i+1;
            if (i == 15)
            begin
                $monitor("count %d", l0_count , l1_count, l2_count);
                $finish();
            end
            else
                $monitor("distance %d", i, dist1, dist2, dist3, minlabel);
        end
    end
    
    assign ith_data = dataset[i];
    
    wire [7:0] dist1, dist2, dist3;
    distance distobj1(ith_data, c1, dist1);
    distance distobj2(ith_data, c2, dist2);
    distance distobj3(ith_data, c3, dist3);
    
    wire [7:0] minlabel;
    minimum obj(dist1, dist2, dist3, minlabel);
    
    
    reg [7:0] en0, en1, en2;
    wire [7:0] l0_count, l1_count, l2_count;
    reg [15:0] data0, data1, data2;
    wire [15:0] l0_sum, l1_sum, l2_sum;
    always@(minlabel)
    begin
        if (minlabel == 0)
        begin
            en0   = 1;
            en1   = 0;
            en2   = 0;
            data0 = ith_data;
            data1 = 0;
            data2 = 0;
        end
        else if (minlabel == 1)
        begin
            en0   = 0;
            en1   = 1;
            en2   = 0;
            data0 = 0;
            data1 = ith_data;
            data2 = 0;
        end
        else
        begin
            en0   = 0;
            en1   = 0;
            en2   = 1;
            data0 = 0;
            data1 = 0;
            data2 = ith_data;
        end
    end
    counter counter0(clk, reset, en0, l0_count);
    counter counter1(clk, reset, en1, l1_count);
    counter counter2(clk, reset, en2, l2_count);
    
    accumulator sum0(clk, reset, data0, l0_sum);
    accumulator sum1(clk, reset, data1, l1_sum);
    accumulator sum2(clk, reset, data2, l2_sum);
    
    
endmodule
    
    module accumulator(clk, reset, data, rdata);
        input clk, reset;
        input [15:0] data;
        output reg [15:0] rdata;
        always@(posedge clk, negedge reset)
        begin
            if (reset == 0)
                rdata = 0;
            else
                rdata = rdata +data;
        end
        
    endmodule
        
        module counter(clk, reset, data, rdata);
            input clk, reset;
            input [7:0] data;
            output reg [7:0] rdata;
            always@(posedge clk, negedge reset)
            begin
                if (reset == 0)
                    rdata = 0;
                else
                    rdata = rdata +data;
            end
            
        endmodule
            
            
            
            
            
            
            
