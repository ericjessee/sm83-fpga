This repo is for my sm83-fpga project.

Very much a work in progress. 

note- original ISE project based on https://alchitry.com/creating-an-ise-project-verilog

a handful of modules were created on https://circuitverse.org/simulator and then converted to verilog using the built-in tool


current status: I can read a single instruction from memory and execute it. 
this is made possible by being able to use the program counter for memory access
and incrementing it arbitrarily using the return_state var.
is this the right way to go? or should I be using an address buffer,
I could then write pc+some arbitrary value in order to access. 
then instruction fetch is slower, unless i mux it
still just mostly guessing how the cpu is supposed to work

as of 06-13 -- added handling of all 8 bit immediate loads, but still need to actually
hook up the signals to the register file. I wonder if I should just use a register
and turn things on/off bitwise rather than declaring individual signals.. probably a good idea

next: implement more instructions. -- jp, add, and cmp would be good. 
then I could write a for loop. 
note - add and cmp need ALU and status flag regs. (more work)
maybe just jmp first 