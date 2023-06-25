#!/bin/bash
#rgbds assembler (https://rgbds.gbdev.io/)
echo "assembling..."
rgbasm -L -o test_opcodes.o test_opcodes.gameboy.asm
echo "linking..."
rgblink -o test_opcodes.gb test_opcodes.o
echo "converting to .coe..."
rm -f rom.coe
python3 convert_to_coe.py test_opcodes.gb