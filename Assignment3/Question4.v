// Q2: Exercise question 2.10. Provide an RTL diagram and its relevant code; also test your code using a stimulus. Keep the input and output bit size equal to 4 bits.
// y[n] = x[n] - x[n-1] + x[n-2] +x[n-3] +0.5y[n-1] +0.25y[n-2]

module bcd(bcd_num,
           out);
    
    input[3:0] bcd_num;
    output[6:0] out;
    reg[6:0] out;
    
    always@(bcd_num)
    begin
        case(bcd_num)
            0:out       = 7'b0000001;
            1:out       = 7'b1001111;
            2:out       = 7'b0010010;
            3:out       = 7'b0000110;
            4:out       = 7'b1001100;
            5:out       = 7'b0100100;
            6:out       = 7'b0100000;
            7:out       = 7'b0001111;
            8:out       = 7'b0000000;
            9:out       = 7'b0001100;
            default:out = 7'b1111111;
        endcase
    end
endmodule
