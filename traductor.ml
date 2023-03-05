open Type

let rec trad_instructions instructions =
  match instructions with
  | [] -> Lexer.error("The program does not contain a marker for its end") 
  | Push n :: rest      -> Printf.printf "\tstack.push(%d); // push\n" n ; trad_instructions rest
  | Dup :: rest         -> Printf.printf "\tlet n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup\n" ; trad_instructions rest
  | Copy n :: rest      -> Printf.printf "\tlet nth = stack[%d-1]; stack.push(nth); // copy\n" n ; trad_instructions rest
  | Swap :: rest        -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap\n"; trad_instructions rest
  | Discard :: rest     -> Printf.printf "\tstack.pop(); // discard \n" ; trad_instructions rest
  | Slide n :: rest     -> Printf.printf "\tlet top = stack.pop().unwrap(); for i in 0..%d{stack.pop();}; stack.push(top); // slide\n" n; trad_instructions rest
  | Add :: rest         -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add\n" ; trad_instructions rest
  | Sub :: rest         -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a); // sub\n" ; trad_instructions rest
  | Mult :: rest        -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b * a); // mult\n" ; trad_instructions rest
  | Div :: rest         -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b / a); // div\n" ; trad_instructions rest
  | Mod :: rest         -> Printf.printf "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b %% a); // mod\n" ; trad_instructions rest
  | Store :: rest       -> Printf.printf "\tlet val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store\n" ; trad_instructions rest
  | Load :: rest        -> Printf.printf "\tlet addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load\n" ; trad_instructions rest
  | Label l :: rest     -> Printf.printf "\t%s(&mut stack, &mut memory);\n}\nfn %s(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label\n" l l ; trad_instructions rest
  | Call l :: rest      -> Printf.printf "\tcall_%s() // call\n" l ; trad_instructions rest
  | Jump l :: rest      -> Printf.printf "\t%s(&mut stack, &mut memory); // jump\n" l ; trad_instructions rest
  | JumpIfZero l :: rest-> Printf.printf "\tif stack.pop().unwrap() == 0 {%s(&mut stack, &mut memory);} // jump if zero\n" l ; trad_instructions rest
  | JumpIfNeg l :: rest -> Printf.printf "\tif stack.pop().unwrap() < 0 {%s(&mut stack, &mut memory));} // jump if neg\n" l ; trad_instructions rest
  | EndSub :: rest      -> Printf.printf "END SUB TODO\n" ; trad_instructions rest
  | EndProg :: _        -> Printf.printf "}\n"
  | OutputChar :: rest  -> Printf.printf "\tprint!(\"{}\", stack.pop().unwrap() as u8 as char); // output char\n" ; trad_instructions rest
  | OutputNum :: rest   -> Printf.printf "\tprintln!(\"{}\", stack.pop().unwrap()); // output num\n" ; trad_instructions rest
  | ReadChar :: rest    -> Printf.printf "\tlet mut input = String::new();io::stdin().read_line(&mut input).expect(\"Error: unable to read user char input\");let addr: i32 = stack.pop().unwrap();memory.insert(addr,input.chars().nth(0).unwrap() as i32); // read char\n" ; trad_instructions rest
  | ReadNum :: rest     -> Printf.printf "READ NUM TODO\n" ; trad_instructions rest