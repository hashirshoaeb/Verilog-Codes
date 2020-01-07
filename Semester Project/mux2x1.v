module mux_2_1(a,
               b,
               s,
               out);
    input[7:0] a,b;
    input s;
    output[7:0] out;
    reg[7:0] out;
    
    always@ (*)
    begin
        if (s == 0)
        begin
            out <= a;
        end
        else
        begin
            out <= b;
        end
    end
endmodule
