open Type

let rec trad_instructions instructions =
  match instructions with
  | [] -> Lexer.error("The program does not contain a marker for its end") 
  | Push n :: rest      -> Printf.printf "\tstack.push(%d); // push\n" n ; trad_instructions rest
  | Dup :: rest         -> Printf.printf "\tlet n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup\n" ; trad_instructions rest
  | Copy n :: rest      -> Printf.printf "\tlet nth = stack[%d]; stack.push(nth); // copy\n" n ; trad_instructions rest
  | Swap :: rest        -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(a); stack.push(b); // swap\n"; trad_instructions rest
  | Discard :: rest     -> Printf.printf "\tstack.pop(); // discard \n" ; trad_instructions rest
  | Slide n :: rest     -> Printf.printf "SLIDE TODO\n" ; trad_instructions rest
  | Add :: rest         -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add\n" ; trad_instructions rest
  | Sub :: rest         -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a); // sub\n" ; trad_instructions rest
  | Mult :: rest        -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b * a); // mult\n" ; trad_instructions rest
  | Div :: rest         -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b / a); // div\n" ; trad_instructions rest
  | Mod :: rest         -> Printf.printf "let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b MODPB a); // mod\n" ; trad_instructions rest
  | Store :: rest       -> Printf.printf "\tlet val = stack.pop().unwrap(); let addr = stack.pop().unwrap(); memory[addr as usize] = val; // store\n" ; trad_instructions rest
  | Load :: rest        -> Printf.printf "\tlet addr = stack.pop().unwrap(); let val = memory[addr as usize]; stack.push(val); // load\n" ; trad_instructions rest
  | Label l :: rest     -> Printf.printf "\t%s: // label\n" l ; trad_instructions rest
  | Call l :: rest      -> Printf.printf "\tcall_%s() // call\n" l ; trad_instructions rest
  | Jump l :: rest      -> Printf.printf "\tgoto_%s(); // jump\n" l ; trad_instructions rest
  | JumpIfZero l :: rest-> Printf.printf "\tif stack.pop().unwrap() == 0 {{ goto_%s(); }} // jump if zero\n" l ; trad_instructions rest
  | JumpIfNeg l :: rest -> Printf.printf "\tif stack.pop().unwrap() < 0 {{ goto_%s(); // jump if neg}}\n" l ; trad_instructions rest
  | EndSub :: rest      -> Printf.printf "END SUB TODO\n" ; trad_instructions rest
  | EndProg :: _        -> Printf.printf "}\n"
  | OutputChar :: rest  -> Printf.printf "\tprint!(\"{}\", stack.pop().unwrap() as u8 as char); // output char\n" ; trad_instructions rest
  | OutputNum :: rest   -> Printf.printf "\tprintln!(\"{}\", stack.pop().unwrap()); // output num\n" ; trad_instructions rest
  | ReadChar :: rest    -> Printf.printf "READ CHAR TODO\n" ; trad_instructions rest
  | ReadNum :: rest     -> Printf.printf "READ NUM TODO\n" ; trad_instructions rest