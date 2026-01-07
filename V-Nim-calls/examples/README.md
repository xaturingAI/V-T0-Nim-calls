# V-Nim Interoperability Examples

This project demonstrates bidirectional interoperability between V and Nim programming languages.

## Overview

The examples show how to:
1. Call Nim functions from V programs
2. Call V functions from Nim programs

## Files

### Nim calling V:
- `vlib.v` - V library with exported functions
- `nim_calls_v.nim` - Nim program that calls V functions

### V calling Nim:
- `nimlib.nim` - Nim library with exported functions  
- `v_calls_nim.v` - V program that calls Nim functions

### Supporting files:
- `libvlib.h` - C header for V library
- `libnimlib.h` - C header for Nim library

## Building and Running

### To build and run V calling Nim:
```bash
# Compile Nim library
nim c --app:lib --out:libnimlib.so nimlib.nim

# Compile V program that calls Nim
v -o v_calls_nim.c v_calls_nim.v
gcc -o v_calls_nim v_calls_nim.c -I. ./libnimlib.so -lm -lpthread -lgc -lexecinfo

# Run
LD_LIBRARY_PATH=. ./v_calls_nim
```

### To build and run Nim calling V:
```bash
# Compile V library
v -cc gcc -shared -o libvlib.so vlib.v

# Compile Nim program that calls V
nim c -d:release nim_calls_v.nim

# Run
LD_LIBRARY_PATH=. ./nim_calls_v
```

## Results

Both directions of interop work successfully:
- V can call Nim functions: addNumbers, greet, calculateFibonacci
- Nim can call V functions: v_add_numbers, v_greet, v_calculate_fibonacci