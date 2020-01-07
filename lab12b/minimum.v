module minimum(dist1,
               dist2,
               dist3,
               minlabel);
    input [7:0] dist1, dist2, dist3;
    output [7:0] minlabel;
    
    wire [7:0] out12, temp;
    wire sel1, sel2;
    
    assign sel1 = (dist1 > dist2);
    mux2x1 check12(8'b00000000, 8'b00000001, sel1, out12);
    
    mux2x1 checkdis12(dist1, dist2, sel1, temp);
    
    assign sel2 = (temp > dist3);
    mux2x1 check123(out12, 8'b00000010, sel2, minlabel);
    
endmodule
