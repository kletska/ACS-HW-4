#!/bin/sh

nasm -felf64 -o ./build/main.obj ./src/main.asm
gcc -no-pie ./build/main.obj -o ./bin/task04
