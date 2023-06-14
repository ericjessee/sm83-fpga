#this script will take a .gb ROM and convert it to a .coe that can be preloaded into memory inside Xilinx IP
import sys, os

with open(sys.argv[1], 'rb') as rom:
    with open("rom.coe", 'x') as mem:
        print("memory_initialization_radix=16;", file=mem)
        print("memory_initialization_vector=",  file=mem)
        rom_size=rom.seek(0, os.SEEK_END)
        rom.seek(0)
        for i in range(rom_size-1):
            byte = rom.read(1)
            print("{},".format(byte.hex()), file=mem)
        byte = rom.read(1)    
        print("{};".format(byte.hex()), file=mem, end='')
