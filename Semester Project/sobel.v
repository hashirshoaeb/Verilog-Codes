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
    
    reg [7:0] ROM [0:4095];  // = > 64*64 - 1 = > sizeofimage - 1
    initial
    begin
        $readmemb ("in.txt", ROM, 0, 4095);
        $monitor("data_file handle was %0b", ROM[38]);
        $finish;
    end
endmodule
