`include "mux2x1.v"
module sobel(clk,
             reset);
    // https://timetoexplore.net/blog/initialize-memory-in-verilog
    reg [7:0] ROM_IN  [0:4095];  // = > 64*64 - 1 = > sizeofimage - 1
    reg [7:0] ROM_OUT [0:4095];
    input clk, reset;
    reg [6:0] row, col, n;
    reg [3:0] count;
    reg [12:0] k,l0,l1,l2,l3,l4,l5,l6,l7,l8;
    
    initial
    begin
        n = 64;
        t = 27;
        // reading from in.txt and saving in ROM_IN from address 0 to 4095
        $readmemb ("in.txt", ROM_IN, 0, 4095);
        // $monitor("data_file handle was %0b", ROM_IN[38]);
        // writing to out.txt from ROM_IN from address 0 to 4095
        // $writememb("out.txt",ROM_OUT);
    end
    
    
    always@(posedge clk, negedge reset)
    begin
        if (reset == 0)
        begin
            row   = 1;
            col   = 1;
            count = 0;
        end
        else
        begin
            count = count + 1;
            if (count > 9)
            begin
                count = 0;
                col   = col+1;
                if (col > 64-2)
                begin
                    col = 1;
                    row = row + 1;
                    if (row > 64-2)
                    begin
                        row = 1;
                        $writememb("out.txt",ROM_OUT);
                        $finish();
                    end
                end
            end
        end
    end
    
    always@(row, col)
    begin
        k  = 0 + (row * n);
        l0 = k - n + col - 1;
        l1 = k - n + col;
        l2 = k - n + (col + 1);
        l3 = k + (col - 1);
        l4 = k + col;
        l5 = k + (col + 1);
        l6 = k + n + (col - 1);
        l7 = k + n + col;
        l8 = k + n + (col + 1);
    end
    
    
    reg [7:0] t;
    reg [7:0]s0,s1,s2,s3,s4,s5,s6,s7,s8;
    wire d;
    wire [7:0]a0,a1,a2,a3;
    wire [7:0]f9,f10,f11,f12,f13,f14;
    wire [7:0]g1,g2,g3,g4;
    wire c2,c5,c3,c4;
    wire [7:0]tem1,tem2;
    
    
    always@(posedge clk)
    begin
        if (count == 1)
            s0 <= ROM_IN[l0]>>2;
        else if (count == 2)
            s1 <= ROM_IN[l1]>>2;
        else if (count == 3)
            s2 <= ROM_IN[l2]>>2;
        else if (count == 4)
            s3 <= ROM_IN[l3]>>2;
        else if (count == 5)
            s4 <= ROM_IN[l4]>>2;
        else if (count == 6)
            s5 <= ROM_IN[l5]>>2;
        else if (count == 7)
            s6 <= ROM_IN[l6]>>2;
        else if (count == 8)
            s7 <= ROM_IN[l7]>>2;
        else if (count == 9)
        begin
            s8 <= ROM_IN[l8]>>2;
        end
        else
        begin
            // REMOVE THE ELSE BLOCK
        end
    end
    
    assign    a1 = s0+s1;
    assign    a3 = s1+s2;
    assign    a2 = s3+s6;
    assign   a0  = s5+s7;
    assign   f10 = a1+s3;
    assign   f11 = a3+s5;
    assign   f12 = a2+s7;
    assign   f9  = a0+s8;
    
    assign  g1         = f10-f9;
    assign  g3         = f11-f12;
    assign  {c2, g2}   = f11-f12;
    assign  {c5, g4}   = f10-f9;
    assign  {c3, tem1} = f14-t;
    assign  {c4, tem2} = f13-t;
    
    mux_2_1 ob1(g2,g3,c2,f14);
    mux_2_1 ob2(g4,g1,c5,f13);
    
    assign d = ~(c3&c4);
    always@(posedge clk)
        ROM_OUT[l4] = d;
    
endmodule
    
    // In order to read and write a file following commands are used in Verilog.
    // •	Reading a file in Verilog
    // reg [<memory_width>] <reg_name> [<memory_depth>];
    
    // initial
    // $readmemb ("<file_name>", <reg_name>, <start_address>, <end_address>);
    
    // •	Writing a file in verilog
    // always@(posedge	 clk)
    // $fwrite(<file_desc>, "%d", out);
    // initial
    // File_desc = $fopen(“filename.txt”,w);
    
    // integer id;
    // initial
    // Id = $fopen(“File path and name”, mode);	//here mode = “w”
    
    // always@(posedge clk)
    // begin
    //for reading sample by sample data and writing data into file
    // for file writing using following syntax
    // $fwrite(id, out);
    // $fwrite(id, “\n”); 	//for newline
    // end
    
    
    // ________________
    // | P0 | P1 | P2 |     --------> n columns
    // |----|----|----|     |
    // | P3 | P4 | P5 |     |
    // |----|----|----|     |
    // | P6 | P7 | P8 |     m rows
    // ----------------
    
    // | P0 |
    // | P1 |
    // | P2 |
    // | P3 |
    // | P4 |
    // | P5 |
    // | P6 |
    // | P7 |
    // | P8 |
    // row major
    
    // Variable ‘i’ represents row number whereas j represents column number
    // Variable ‘B’ is the base address of the array
    // Variable ‘n’ is the total number of the column of an image
    
    // get_Index obj(clk,row,j,l0,l1,l2,l3,l4,l5,l6,l7,l8);
