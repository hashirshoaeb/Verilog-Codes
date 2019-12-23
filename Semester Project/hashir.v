module convolution(p0,
                   p1,
                   p2,
                   p3,
                   p4,
                   p5,
                   p6,
                   p7,
                   p8,
                   t,
                   d);
    
    input [7:0]p0,p1,p2,p3,p4,p5,p6,p7,p8,t;
    reg [7:0]s0,s1,s2,s3,s4,s5,s6,s7,s8;
    output wire[7:0]d;
    reg [7:0]a0,a1,a2,a3;
    reg [7:0]f9,f10,f11,f12,f13,f14;
    reg [7:0]g1,g2,g3,g4;
    reg c2,c5,c3,c4;
    reg [7:0]tem1,tem2;
    
    assign d = ~(c3&c4);
    
    always@(*)begin
        s0 = p0>>2; s1 = p1>>2; s2 = p2>>2; s3 = p3>>2; s4 = p4>>2;
        s5 = p5>>2; s6 = p6>>2; s7 = p7>>2; s8 = p8>>2;
    end
    always@(*)begin
        a1  = s0+s1;
        a3  = s1+s2;
        a2  = s3+s6;
        a0  = s5+s7;
        f10 = a1+s3;f11 = a3+s5;
        f12 = a2+s7;
        f9  = a0+s8;
    end
    always@(*)begin
        g1         = f10-f9;
        g3         = f11-f12;
        {c2, g2}   = f11-f12;
        {c5, g4}   = f10-f9;
        {c3, tem1} = f14-t;
        {c4, tem2} = f13-t;
    end
    
    mux_2_1 ob1(g2,g3,c2,f14);
    mux_2_1 ob2(g4,g1,c5,f13);
    
endmodule
    
    
    
    module mux_2_1(a,b,s,out);
        input[7:0] a,b;
        input s;
        output[7:0] out;
        reg[7:0] out;
        
        always@ (a,b,s)
        begin
            if (s == 0)
            begin
                out = a;
            end
            else
            begin
                out = b;
            end
        end
    endmodule
        
        
