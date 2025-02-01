# Core-NASM

An assembly library containing basic subroutines for console applications written in NASM.

## Available subroutines

Below are the available subroutines that are available in Core-NASM:

### Console

- `print`: Prints a string stored in the `rsi` to the console.
- `input`: Reads a string from the console and stores it in `rsi`.

### String manipulation

- `strlen`: Calculates the length of a string stored in `rsi`.

## Installation

Build the project using `bash build.bash` and copy the resulting object file to your project directory. Include the object file when compiling your project.
