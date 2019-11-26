module mainfile(clk,
                reset,
                disp_switch,
                sample_switch,
                seg_7);
    input clk, reset, disp_switch;
    input [1:0] sample_switch; // 2 bits
    output reg [6:0]seg_7;
    reg [7:0]seg;
    
    wire my_clk;
    reg [25:0] counter;
    // Clk
    assign my_clk = counter[25];//(counter > = 15000000);
    // Counter
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            counter <= 0;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
    
    // initialise ROM for A and B
    reg [3:0] ROM_A [0:8];
    reg [3:0] ROM_B [0:8];
    reg [7:0] P; // 8 bit
    
    initial
    begin
        ROM_A[0] = 4'b0001;
        ROM_A[1] = 4'b0001;
        ROM_A[2] = 4'b0001;
        ROM_A[3] = 4'b0001;
        ROM_A[4] = 4'b0001;
        ROM_A[5] = 4'b0001;
        ROM_A[6] = 4'b0001;
        ROM_A[7] = 4'b0001;
        ROM_A[8] = 4'b0001;
        ROM_B[0] = 4'b0001;
        ROM_B[1] = 4'b0001;
        ROM_B[2] = 4'b0001;
        ROM_B[3] = 4'b0001;
        ROM_B[4] = 4'b0001;
        ROM_B[5] = 4'b0001;
        ROM_B[6] = 4'b0001;
        ROM_B[7] = 4'b0001;
        ROM_B[8] = 4'b0001;
    end
    
    reg [3:0] sum_count;
    reg [3:0] N_samples;
    always@(sample_switch)
    begin
        case(sample_switch)
            0: N_samples       = 7'b0001;
            1: N_samples       = 7'b0010;
            2: N_samples       = 7'b0100;
            default: N_samples = 7'b1000;
        endcase
    end
    // operating corelation
    always@(posedge my_clk, negedge reset)
    begin
        if (reset == 0)
        begin
            sum_count <= 0;
            P         <= 0;
        end
        else
        begin
            if (sum_count < N_samples) // < or less <= 
            begin
                P         <= P + (ROM_A[sum_count] * ROM_B[sum_count]);
                sum_count <= sum_count + 1;
            end
            
        end
    end
    
    always@(*)
    begin
        case(disp_switch)
            0: seg       = {6'b0 , sample_switch}; //8
            default: seg = P; //8
        endcase
    end
    
    // 7 segment display
    always@(seg)
    begin
        case(seg)
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
            default: seg_7 = 7'b0000001;
        endcase
    end
endmodule
