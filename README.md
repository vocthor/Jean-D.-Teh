# JEAN D. TEH

## A Whitespace to Rust transpiler

The aim of this project was to create a Whitespace compiler to Rust, written in OCaml.

The name "Jean D. Teh" is a private joke in french. As we go from Whitespace to Rust we do the opposite of a detergent : "Jean D. Teh" is the french back slang of detergent.

## Requirements

You need to have ocamlbuild (an OCaml compiler) and rustc (a Rust compiler).

## How to Use

First compile from the root of this project :

> `make`

Then execute with your input Whitespace program file as a parameter:

> `./main.native <file>.ws [--BroyerlalanguedeMoliere]`

`--BroyerlalanguedeMoliere` is an option similar to verbose, displaying intermediate information. The name is again a joke coming from a french meme.

It will result in a equivalent Rust program.

At last, you can compile your Rust program into an executable, and execute it :

> `rustc <file>.rs` > `./<file>`

## Errors

Our compiler doesn't check if your Whitespace program is valid. Using an invalid Whitespace program as input may lead to compilation errors when compiling the Rust program, or may lead to unexpected behaviors during execution of the final compiled Rust program.
