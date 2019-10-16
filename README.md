# Verilog Lab 1

I'm using cli based [verilog compiler](http://iverilog.icarus.com/) to build my lab tasks/projects on mac. I'm Computer Engineering student and learning verilog under Digital System Design course in 7th semester.

## Development environment

I'm using [vscode](https://code.visualstudio.com/) as an editor tool and using
[leafvmaple.verilog](https://github.com/leafvmaple/vscode-verilog) which provides a nice interface to run .v file, and
[ericsonj.verilogformat](https://github.com/ericsonj/verilog-format) extension which automatically formates the code. Installation steps are written in their respective README.md files. Also, I'm using [scansion.app](http://www.logicpoet.com/scansion/) for GUI simulation.

If you have iverilog and Scansion.app then you can also generate output using following commands in terminal.app:

```bash
    $ iverilog -o <task1_tb.v.out> <task1_tb.v>
    $ vvp <task1_tb.v.out>
    $ open -a Scansion <task1.vcd>
```

### note

The above commands I used to run [lab2/task1_tb.v](./lab2/task1_tb.v).
You need to write test bench (ie: \_tb.v) to test your code.

## Helpful links

- [https://iverilog.fandom.com/wiki/Installation_Guide](https://iverilog.fandom.com/wiki/Installation_Guide)
- [https://www.swarthmore.edu/NatSci/mzucker1/e15_f2014/iverilog.html](https://www.swarthmore.edu/NatSci/mzucker1/e15_f2014/iverilog.html)
- [https://iverilog.fandom.com/wiki/Getting_Started](https://iverilog.fandom.com/wiki/Getting_Started)
