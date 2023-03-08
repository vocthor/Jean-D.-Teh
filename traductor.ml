open Type

let rec trad_instructions instructions oc =
  match instructions with
  | [] -> Printf.fprintf oc "}"
  | Push n :: rest      -> Printf.fprintf oc "\tstack.push(%d); // push\n" n ; trad_instructions rest oc
  | Dup :: rest         -> Printf.fprintf oc "\tlet n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup\n" ; trad_instructions rest oc
  | Copy n :: rest      -> Printf.fprintf oc "\tlet nth = stack[%d-1]; stack.push(nth); // copy\n" n ; trad_instructions rest oc
  | Swap :: rest        -> Printf.fprintf oc "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap\n"; trad_instructions rest oc
  | Discard :: rest     -> Printf.fprintf oc "\tstack.pop(); // discard \n" ; trad_instructions rest oc
  | Slide n :: rest     -> Printf.fprintf oc "\tlet top = stack.pop().unwrap(); for i in 0..%d{stack.pop();}; stack.push(top); // slide\n" n; trad_instructions rest oc
  | Add :: rest         -> Printf.fprintf oc "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add\n" ; trad_instructions rest oc
  | Sub :: rest         -> Printf.fprintf oc "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a); // sub\n" ; trad_instructions rest oc
  | Mult :: rest        -> Printf.fprintf oc "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b * a); // mult\n" ; trad_instructions rest oc
  | Div :: rest         -> Printf.fprintf oc "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b / a); // div\n" ; trad_instructions rest oc
  | Mod :: rest         -> Printf.fprintf oc "\tlet a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b %% a); // mod\n" ; trad_instructions rest oc
  | Store :: rest       -> Printf.fprintf oc "\tlet val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store\n" ; trad_instructions rest oc
  | Load :: rest        -> Printf.fprintf oc "\tlet addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load\n" ; trad_instructions rest oc
  | Label l :: rest     -> Printf.fprintf oc "\t%s(stack, memory);\n}\nfn %s(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label\n" l l ; trad_instructions rest oc
  | Call l :: rest      -> Printf.fprintf oc "\tfunc_refs.push(<name>);\n\t%s(stack, memory);\n}\n<name>(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>){ // call\n}" l; trad_instructions rest oc
  | Jump l :: rest      -> Printf.fprintf oc "\t%s(stack, memory); // jump\n" l ; trad_instructions rest oc
  | JumpIfZero l :: rest-> Printf.fprintf oc "\tif stack.pop().unwrap() == 0 {%s(stack, memory);} // jump if zero\n" l ; trad_instructions rest oc
  | JumpIfNeg l :: rest -> Printf.fprintf oc "\tif stack.pop().unwrap() < 0 {%s(stack, memory));} // jump if neg\n" l ; trad_instructions rest oc
  | EndSub :: rest      -> Printf.fprintf oc "\tlet fct = fct_refs.pop().unwrap();\n\tfct(stack, memory); //end sub routine\n" ; trad_instructions rest oc
  | EndProg :: rest     -> Printf.fprintf oc "\tprocess::exit(0); // end prog\n" ; trad_instructions rest oc
  | OutputChar :: rest  -> Printf.fprintf oc "\tprint!(\"{}\", stack.pop().unwrap() as u8 as char); // output char\n" ; trad_instructions rest oc
  | OutputNum :: rest   -> Printf.fprintf oc "\tprint!(\"{}\", stack.pop().unwrap()); // output num\n" ; trad_instructions rest oc
  | ReadChar :: rest    -> Printf.fprintf oc "\tlet mut input = String::new();io::stdin().read_line(&mut input).expect(\"Error: unable to read user char input\");let addr: i32 = stack.pop().unwrap();memory.insert(addr,input.chars().nth(0).unwrap() as i32); // read char\n" ; trad_instructions rest oc
  | ReadNum :: rest     -> Printf.fprintf oc "\tlet mut input = String::new();io::stdin().read_line(&mut input).expect(\"Error: unable to read user char input\");let addr: i32 = stack.pop().unwrap();input.pop();memory.insert(addr, input.parse::<i32>().unwrap()); // read num\n" ; trad_instructions rest oc