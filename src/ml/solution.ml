type whitespace_token =
  | Space
  | Tab
  | Linefeed

type instruction =
  | Push of int
  | Dup
  | Swap
  | Discard
  | Add
  | Subtract
  | Multiply
  | Divide
  | Modulo
  | Store
  | Load
  | OutputChar
  | OutputNum
  | ReadChar
  | ReadNum
  | Label of string
  | Call of string
  | Jump of string
  | JumpIfZero of string
  | JumpIfNeg of string
  | Return

type program = instruction list

let rec parse_whitespace (input : char list) (output : whitespace_token list) : whitespace_token list =
  match input with
  | [] -> List.rev output
  | ' ' :: rest -> parse_whitespace rest (Space :: output)
  | '\t' :: rest -> parse_whitespace rest (Tab :: output)
  | '\n' :: rest -> parse_whitespace rest (Linefeed :: output)
  | _ :: rest -> parse_whitespace rest output

let rec parse_instruction (tokens : whitespace_token list) (output : instruction list) : instruction list =
  match tokens with
  | [] -> List.rev output
  | Space :: Space :: rest -> parse_instruction rest (Push 0 :: output)
  | Space :: Tab :: rest -> parse_instruction rest (Push 1 :: output)
  | Space :: Linefeed :: rest -> parse_instruction rest (Push (-1) :: output)
  | Tab :: Space :: rest -> parse_instruction rest Dup :: output
  | Tab :: Tab :: rest -> parse_instruction rest Swap :: output
  | Tab :: Linefeed :: rest -> parse_instruction rest Discard :: output
  | Linefeed :: Space :: rest -> parse_instruction rest Add :: output
  | Linefeed :: Tab :: rest -> parse_instruction rest Subtract :: output
  | Linefeed :: Linefeed :: rest -> parse_instruction rest Multiply :: output
  | Space :: Tab :: Space :: rest -> parse_instruction rest Divide :: output
  | Space :: Tab :: Tab :: rest -> parse_instruction rest Modulo :: output
  | Tab :: Space :: Space :: rest -> parse_instruction rest Store :: output
  | Tab :: Space :: Tab :: rest -> parse_instruction rest Load :: output
  | Space :: Linefeed :: Space :: rest -> parse_instruction rest OutputChar :: output
  | Space :: Linefeed :: Tab :: rest -> parse_instruction rest OutputNum :: output
  | Tab :: Linefeed :: Space :: rest -> parse_instruction rest ReadChar :: output
  | Tab :: Linefeed :: Tab :: rest -> parse_instruction rest ReadNum :: output
  | Linefeed :: Tab :: Space :: label -> parse_instruction (List.tl rest) (Label label :: output)
  | Linefeed :: Tab :: Tab :: label -> parse_instruction (List.tl rest) (Call label :: output)
  | Linefeed :: Tab :: Linefeed :: label -> parse_instruction (List.tl rest) (Jump label :: output)
  | Linefeed :: Space :: Tab :: label -> parse_instruction (List.tl rest) (JumpIfZero label :: output)
  | Linefeed :: Space :: Space :: label -> parse_instruction (List.tl rest) (JumpIfNeg label :: output)
  | Linefeed :: Linefeed :: rest -> parse_instruction rest Return :: output
  | _ -> output

let compile_whitespace (input : string) : string =
  let tokens = parse_whitespace (List.of_seq (String.to_seq input)) [] in
  let program = parse_instruction tokens [] in
  let rec compile_instruction (instruction : instruction) : string =
  match instruction with
  | Push n -> format!("stack.push({});\n", n)
  | Dup -> "let n = stack.pop().unwrap(); stack.push(n); stack.push(n);\n".to_string()
  | Swap -> "let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(a); stack.push(b);\n".to_string()
  | Discard -> "stack.pop();\n".to_string()
  | Add -> "let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a);\n".to_string()
  | Subtract -> "let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a);\n".to_string()
  | Multiply -> "let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b * a);\n".to_string()
  | Divide -> "let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b / a);\n".to_string()
  | Modulo -> "let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b % a);\n".to_string()
  | Store -> "let n = stack.pop().unwrap(); let addr = stack.pop().unwrap(); memory[addr as usize] = n;\n".to_string()
  | Load -> "let addr = stack.pop().unwrap(); stack.push(memory[addr as usize]);\n".to_string()
  | OutputChar -> "print!(\"{}\", stack.pop().unwrap() as u8 as char);\n".to_string()
  | OutputNum -> "println!(\"{}\", stack.pop().unwrap());\n".to_string()
  | ReadChar -> "let c = io::stdin().bytes().next().unwrap().unwrap(); stack.push(c as i32);\n".to_string()
  | ReadNum -> "let mut line = String::new(); io::stdin().read_line(&mut line).unwrap(); let n = line.trim().parse().unwrap(); stack.push(n);\n".to_string()
  | Label name -> format!("{}:\n", name)
  | Call name -> format!("call_{}();\n", name)
  | Jump name -> format!("goto_{}();\n", name)
  | JumpIfZero name -> format!("if stack.pop().unwrap() == 0 {{ goto_{}(); }}\n", name)
  | JumpIfNeg name -> format!("if stack.pop().unwrap() < 0 {{ goto_{}(); }}\n", name)
  | Return -> "return;\n".to_string()
  in
  let mut output = String::new() in
  output.push_str("use std::io;\n");
  output.push_str("let mut stack = Vec::new();\n");
  output.push_str("let mut memory = [0; 65536];\n");
  for instruction in program {
    match instruction with
    | Label name -> output.push_str(&format!("fn goto_{}() {{}}\n", name))
    | Call name -> output.push_str(&format!("fn call_{}() {{}}\n", name))
    | _ -> {}
  }
  for instruction in program {
  output.push_str(&compile_instruction(instruction));
  }
  output
