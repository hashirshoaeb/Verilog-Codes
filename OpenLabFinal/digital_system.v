
module digital_system(clk,
                      reset,
                      in,
                      final_out);
    input clk, reset;
    input [9:0] in;
    output final_out;
    
    wire [9:0] out;
    wire [9:0] der;
    wire [9:0] dummy_out;
    partA obj(slow_clk, reset, in, out);
    derivative obj1(slow_clk, reset, out, der);
    mydummy obj2(der,dummy_out);
    wire slow_clk;
    // clkgen obj3(clk, reset, slow_clk)
    
endmodule
    module clkgen(clk, reset, outT, out_sample);
        input clk, reset;
        output outT, out_sample;
        reg [7:0] sample_count;
        
        always@(posedge clk, negedge reset)
        begin
            if (reset == 0)
            begin
                sample_count <= 0;
            end
            else
            begin
                if (sample_count > 160)
                begin
                    sample_count <= 0
                end
                else
                begin
                    sample_count <= sample_count + 1;
                end
            end
        end
        assign outT       = Tcount[3];
        assign out_sample = (sample_count == 160);
    endmodule
        module mydummy(in, out);
            input [9:0]in;
            output [9:0] out;
            assign out = in;
        endmodule
            
            module derivative(clk, reset, in, der);
                input clk, reset;
                input [9:0] in;
                output [9:0] der;
                reg [9:0] in1, in2;
                
                assign der = in - in2;
                always@(posedge clk, negedge reset)
                begin
                    if (reset == 0)
                    begin
                        in1 <= 0;
                        in2 <= 0;
                    end
                    else
                    begin
                        in1 <= in;
                        in2 <= in1;
                    end
                end
            endmodule
                
                
                module partA(clk, reset, in, out);
                    input clk, reset;
                    input [9:0]in;
                    output [9:0]out;
                    reg [9:0] RAM [0:511];
                    reg [8:0] RAM_index;
                    
                    assign out = in;
                    always@(posedge clk, negedge reset)
                    begin
                        if (reset == 0)
                        begin
                            RAM_index <= 0;
                        end
                        else
                        begin
                            RAM_index <= RAM_index + 1;
                        end
                    end
                    
                    always@(*)
                    begin
                        RAM[RAM_index] <= in;
                    end
                endmodule
