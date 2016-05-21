# Executable and Linking Format (ELF)

The nitty-gritty on executables and object files.

Some assembly required.

Evan Klitzke <evan@uber.com>

---

## Outline

* C and x86 Crash Course
* Intro To Linking
* Executables
* Shared Libraries
* PIE and ALSR

---

## Motivation

This is how **every** program on Linux/BSD systems works. This is how Go
exectutables and libraries work.

The ELF file format is used by every Unix except OS X, but the same concepts
apply to OS X (which arbitrarily uses a different executable/object format
called Mach-O).

---

## C Hello World

This is the classic Hello World program in C:

    #include <stdio.h>

    int main(int argc, char **argv) {
      puts("Hello, world!");
      return 0;
    }

---

## History

In the earliest days of computers, compilers would take all of the input source
code and analyze all of it to create an executable with actual machine code. For
small programs this is OK, but for larger programs it becomes prohibitively slow
and expensive to do this.

---

## History

To fix this we need an intermediate format to allow us compile small chunks of
the program independently. That way changing code only requires recompiling that
chunk of the program.

---

## Key Terms

C code is **compiled** to produce **object files**.

Object files are **linked** to produce **executables**.

    $ cc -c hello.c        # creates hello.o
    $ cc hello.o -o hello  # creates hello

Both object files and executables contain actual machine code.

---

## What's In `hello.o`

From the perspective of the compiler, a program is logically composed of:

* functions (code)
* global/static variables (data)

Both functions and variables have names, which are called *symbols*. A symbol
can either be code or data.
