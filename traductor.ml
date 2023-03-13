open Type

let call_number = ref 0

let newcall () = incr call_number

let rec trad_instructions instructions oc =
  match instructions with
  | [] -> Printf.fprintf oc "\t}\n} // the end"
  | Push n :: rest      -> Printf.fprintf oc "\t\tself.stack.push(%d); // push\n" n ; trad_instructions rest oc
  | Dup :: rest         -> Printf.fprintf oc "\t\tlet n = self.stack.pop().unwrap(); self.stack.push(n); self.stack.push(n); // dup\n" ; trad_instructions rest oc
  | Copy n :: rest      -> Printf.fprintf oc "\t\tlet nth = self.stack[%d]; self.stack.push(nth); // copy\n" n ; trad_instructions rest oc
  | Swap :: rest        -> Printf.fprintf oc "\t\tlet a = self.stack.pop().unwrap(); let b = self.stack.pop().unwrap(); self.stack.push(a); self.stack.push(b); // swap\n"; trad_instructions rest oc
  | Discard :: rest     -> Printf.fprintf oc "\t\tself.stack.pop(); // discard \n" ; trad_instructions rest oc
  | Slide n :: rest     -> Printf.fprintf oc "\t\tlet top = self.stack.pop().unwrap(); for _ in 0..%d{self.stack.pop();}; self.stack.push(top); // slide\n" n; trad_instructions rest oc
  | Add :: rest         -> Printf.fprintf oc "\t\tlet a = self.stack.pop().unwrap(); let b = self.stack.pop().unwrap(); self.stack.push(b + a); // add\n" ; trad_instructions rest oc
  | Sub :: rest         -> Printf.fprintf oc "\t\tlet a = self.stack.pop().unwrap(); let b = self.stack.pop().unwrap(); self.stack.push(b - a); // sub\n" ; trad_instructions rest oc
  | Mult :: rest        -> Printf.fprintf oc "\t\tlet a = self.stack.pop().unwrap(); let b = self.stack.pop().unwrap(); self.stack.push(b * a); // mult\n" ; trad_instructions rest oc
  | Div :: rest         -> Printf.fprintf oc "\t\tlet a = self.stack.pop().unwrap(); let b = self.stack.pop().unwrap(); self.stack.push(b / a); // div\n" ; trad_instructions rest oc
  | Mod :: rest         -> Printf.fprintf oc "\t\tlet a = self.stack.pop().unwrap(); let b = self.stack.pop().unwrap(); self.stack.push(b %% a); // mod\n" ; trad_instructions rest oc
  | Store :: rest       -> Printf.fprintf oc "\t\tlet val: i32 = self.stack.pop().unwrap(); let addr: i32 = self.stack.pop().unwrap(); self.memory.insert(addr, val); // store\n" ; trad_instructions rest oc
  | Load :: rest        -> Printf.fprintf oc "\t\tlet addr = self.stack.pop().unwrap(); let val = self.memory[&addr]; self.stack.push(val); // load\n" ; trad_instructions rest oc
  | Label l :: rest     -> Printf.fprintf oc "\t\tself.%s();\n\t}\n\tfn %s(&mut self) { // label\n" l l ; trad_instructions rest oc
  | Call l :: rest      -> Printf.fprintf oc "\t\tself.calls.push(Whitespace::call_%s);\n\t\tself.%s();\n\t}\n\tfn call_%s(&mut self){ // call\n" (string_of_int !call_number) l (string_of_int !call_number); newcall (); trad_instructions rest oc
  | Jump l :: rest      -> Printf.fprintf oc "\t\tself.%s(); // jump\n" l ; trad_instructions rest oc
  | JumpIfZero l :: rest-> Printf.fprintf oc "\t\tif self.stack.pop().unwrap() == 0 {self.%s();} // jump if zero\n" l ; trad_instructions rest oc
  | JumpIfNeg l :: rest -> Printf.fprintf oc "\t\tif self.stack.pop().unwrap() < 0 {self.%s();} // jump if neg\n" l ; trad_instructions rest oc
  | EndSub :: rest      -> Printf.fprintf oc "\t\tlet fct:  Binop = self.calls.pop().unwrap();\n\t\tfct(self); //end sub routine\n" ; trad_instructions rest oc
  | EndProg :: rest     -> Printf.fprintf oc "\t\tprocess::exit(0); // end prog\n" ; trad_instructions rest oc
  | OutputChar :: rest  -> Printf.fprintf oc "\t\tprint!(\"{}\", self.stack.pop().unwrap() as u8 as char); stdout().flush().unwrap(); // output char\n" ; trad_instructions rest oc
  | OutputNum :: rest   -> Printf.fprintf oc "\t\tprint!(\"{}\", self.stack.pop().unwrap()); stdout().flush().unwrap(); // output num\n" ; trad_instructions rest oc
  | ReadChar :: rest    -> Printf.fprintf oc "\t\tlet mut input = String::new(); stdin().read_line(&mut input).expect(\"Error: unable to read user char input\"); let addr: i32 = self.stack.pop().unwrap(); self.memory.insert(addr,input.chars().nth(0).unwrap() as i32); // read char\n" ; trad_instructions rest oc
  | ReadNum :: rest     -> Printf.fprintf oc "\t\tlet mut input = String::new(); stdin().read_line(&mut input).expect(\"Error: unable to read user char input\"); let addr: i32 = self.stack.pop().unwrap(); input.pop(); self.memory.insert(addr, input.parse::<i32>().unwrap()); // read num\n" ; trad_instructions rest oc