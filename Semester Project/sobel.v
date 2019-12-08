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

module sobel();
    // https://timetoexplore.net/blog/initialize-memory-in-verilog
    reg [7:0] ROM_IN  [0:4095];  // = > 64*64 - 1 = > sizeofimage - 1
    reg [7:0] ROM_OUT [0:4095];
    reg clk;
    integer n = 64;
    integer i;
    integer j;

    initial
    begin
        $dumpfile("sobel.vcd");
        $dumpvars(0, sobel);
        clk = 0;
        n = 64;
        i = 1;
        j = 1;
        #5
        clk = 1;
        // reading from in.txt and saving in ROM_IN from address 0 to 4095
        $readmemb ("in.txt", ROM_IN, 0, 4095);
        $monitor("data_file handle was %0b", ROM_IN[38]);
        // writing to out.txt from ROM_IN from address 0 to 4095
        $writememb("out.txt",ROM_IN);
        $finish;
    end
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
    output reg [13:0] k, l0, l1, l2, l3, l4, l5, l6, l7,l8;
    always@(posedge clk)
    begin  
        for (i = 1; i <= n-2; i = i+1)
        begin
            k = 0 + (i * n);
            for (j = 1; j <= n-2; j = j+1)
            begin
                #15
                l0 = k - n + j - 1;
                l1 = k - n + j;
                l2 = k - n + (j + 1);
                l3 = k + (j - 1);
                l4 = k + j;
                l5 = k + (j + 1);
                l6 = k + n + (j - 1);
                l7 = k + n + j;
                l8 = k + n + (j + 1);
                $monitor("%0d", l0, l1, l2, l3, l4, l5, l6, l7,l8);
            end
        end
    end
endmodule
