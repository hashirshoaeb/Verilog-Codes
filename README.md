# Verilog Development Environment and Example Codes

I'm using cli based [verilog compiler](http://iverilog.icarus.com/) to build my lab tasks/projects on mac. I'm Computer Engineering student and learning verilog under Digital System Design course in 7th semester.

## Goal

This repository is to help macOS and linux users who have just started learning verilog, so that they don't go through to those problems that i have faced. I'm the only mac user in my class. Whole class is using Modelsim for verilog. So here I face the difficulty because Modelsim does not support mac. So following are the instructions that how i setup development environment, and also there are my lab tasks as example codes.

## Development environment

I'm using [vscode](https://code.visualstudio.com/) as an editor tool and using
[leafvmaple.verilog](https://github.com/leafvmaple/vscode-verilog) which provides a nice interface(button) to run .v file, and
[ericsonj.verilogformat](https://github.com/ericsonj/verilog-format) extension which automatically formats the code. Installation steps are written in their respective README.md files. Also, I'm using [scansion.app](http://www.logicpoet.com/scansion/) for GUI simulation.

If you have [iverilog](http://iverilog.icarus.com/) and [scansion.app](http://www.logicpoet.com/scansion/) then you can also generate output using following commands in terminal.app:

```bash
    $ iverilog -o <task1_tb.v.out> <task1_tb.v>
    $ vvp <task1_tb.v.out>
    $ open -a Scansion <task1.vcd>
```

### Note

The above commands I used to run [lab2/task1_tb.v](./lab2/task1_tb.v).
You need to write test bench (ie: \_tb.v) to test your code.

## Helpful links

- [https://iverilog.fandom.com/wiki/Installation_Guide](https://iverilog.fandom.com/wiki/Installation_Guide)
- [https://www.swarthmore.edu/NatSci/mzucker1/e15_f2014/iverilog.html](https://www.swarthmore.edu/NatSci/mzucker1/e15_f2014/iverilog.html)
- [https://iverilog.fandom.com/wiki/Getting_Started](https://iverilog.fandom.com/wiki/Getting_Started)

## Contribution

Pull requests are always welcome. Happy coding :D
