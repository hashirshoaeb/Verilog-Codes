// Q2: Exercise question 2.10. Provide an RTL diagram and its relevant code; also test your code using a stimulus. Keep the input and output bit size equal to 4 bits.
// y[n] = x[n] - x[n-1] + x[n-2] +x[n-3] +0.5y[n-1] +0.25y[n-2]

module Question4(num,
                 out);
    
    input[3:0] num;
    output[6:0] out;
    reg[6:0] out;
    
    always@(num)
    begin
        case(num)
            0:out       = 1;   // 0000001
            1:out       = 79;  // 1001111
            2:out       = 18;  // 0010010
            3:out       = 6;   // 0000110
            4:out       = 76;  // 1001100
            5:out       = 36;  // 0100100
            6:out       = 32;  // 0100000
            7:out       = 15;  // 0001111
            8:out       = 0;   // 0000000
            9:out       = 12;  // 0001100
            default:out = 127; // 1111111
        endcase
    end
endmodule
