#!/bin/bash
echo "assembling..."
rgbasm -L -o hello-world.o hello-world.gameboy.asm
echo "linking..."
rgblink -o hello-world.gb hello-world.o -x