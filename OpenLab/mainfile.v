module mainfile(clk,
                reset,
                disp_switch,
                sample_switch,
                seg_7);
    input clk, reset, disp_switch;
    output [1:0] sample_switch; // 2 bits
    output reg [6:0]seg_7;
    reg [7:0]seg;
    
    // initialise ROM for A and B
    // do operating corelation
    // switch to show output or switch value
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
    
    
    reg [3:0] ROM_A [0:8];
    reg [3:0] ROM_B [0:8];
    reg [7:0] P; // 8 bit
    
    reg [3:0] sum_count;
    // operating corelation
    always@(posedge clk, negedge reset)
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
                P         = P + (ROM_A[sum_count] * ROM_B[sum_count]);
                sum_count = sum_count + 1;
            end
            
        end
    end
    
    always@(disp_switch)
    begin
        case(disp_switch)
            0: seg       = {6'b0 , sample_switch[1:0]}; //8
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
            default: seg_7 = 7'b1111111;
        endcase
    end
endmodule
    
    
