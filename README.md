This repo is for my sm83-fpga project.

Very much a work in progress.

Based around an Alchitry "Mojo" fpga board. It's old and discontinued, but I have one, and don't want to buy something else(yet).

The point of this project isn't so much perfectly accurate fpga implementation of the gameboy-
more so an attempt to reverse engineer the design based on what I know it should do based on context clues, as a learning experience.

a handful of modules were created on https://circuitverse.org/simulator and then converted to verilog using the built-in tool

as of 06-13 -- added handling of all 8 bit immediate loads, but still need to actually
hook up the signals to the register file. I wonder if I should just use a register
and turn things on/off bitwise rather than declaring individual signals.. probably a good idea

next: implement more instructions. -- jp, add, and cmp would be good. 
then I could write a for loop. 
note - add and cmp need ALU and status flag regs. (more work)
maybe just jmp first 

as of 06-24 -- supported 8-bit loads from 16 bit pointers, by adding an address buffer to the output of the cpu to the address bus.
This gives us the ability to latch the pointer into the buffer, and then write back whatever data is pointed to by it. 
(thereby not needing to use the register file to assert the pointer on the address bus directly.)
Also restructured things slightly- we have a cpu_top now. Getting closer to being able to hook interesting peripherals to it. 
Thinking about getting a uart going, so we can talk to the atmel microcontroller that's on the board. 

It's starting to feel like the control unit is just a massive state machine that's running the whole show-- i guess that's 
what it's supposed to be, but it's starting to feel cumbersome. Perhaps some actions could be broken into seperate "mini state machines"
There needs to be some way to actually pipeline things.. no way to do that with the current set up. More research required
