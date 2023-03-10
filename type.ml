type token =
| SPACE
| TAB
| LINEFEED

let print_token = function
| SPACE -> Printf.printf "SPACE\n"
| TAB -> Printf.printf "TAB\n"
| LINEFEED -> Printf.printf "LINEFEED\n"

type instruction =
  | Push of int
  | Dup
  | Copy of int
  | Swap
  | Discard
  | Slide of int
  | Add
  | Sub
  | Mult
  | Div
  | Mod
  | Store
  | Load
  | Label of string
  | Call of string
  | Jump of string
  | JumpIfZero of string
  | JumpIfNeg of string
  | EndSub
  | EndProg
  | OutputChar
  | OutputNum
  | ReadChar
  | ReadNum

let print_instruction = function
  | Push i      -> Printf.printf "Push %d \n" i
  | Dup         -> Printf.printf "Duplicate \n"
  | Copy i      -> Printf.printf "Copy %d \n" i
  | Swap        -> Printf.printf "Swap \n" 
  | Discard     -> Printf.printf "Discard \n"
  | Slide i     -> Printf.printf "Slide %d \n" i
  | Add         -> Printf.printf "Addition \n"
  | Sub    -> Printf.printf "Substraction \n"
  | Mult    -> Printf.printf "Multiplication \n"
  | Div      -> Printf.printf "Divide \n"
  | Mod      -> Printf.printf "Modulo \n"
  | Store       -> Printf.printf "Store \n"
  | Load        -> Printf.printf "Load \n"
  | Label s     -> Printf.printf "Label %s \n" s
  | Call s      -> Printf.printf "Call %s \n" s
  | Jump s      -> Printf.printf "Jump %s \n" s
  | JumpIfZero s -> Printf.printf "JumpIf0 %s \n" s
  | JumpIfNeg s -> Printf.printf "JumpIfNeg %s \n" s
  | EndSub      -> Printf.printf "EndSub \n"
  | EndProg     -> Printf.printf "EndProg \n"
  | OutputChar  -> Printf.printf "OutputChar \n"
  | OutputNum   -> Printf.printf "OutputNum \n"
  | ReadChar    -> Printf.printf "ReadChar \n"
  | ReadNum     -> Printf.printf "ReadNum \n"

type program = instruction list