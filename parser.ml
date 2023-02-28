open Type


let rec get_value tokens res sign =
  match tokens with
  | [] -> Lexer.error("Number not ended")
  | SPACE :: rest -> get_value rest (res*2) sign
  | TAB :: rest -> get_value rest (res*2 + 1) sign
  | LINEFEED :: rest -> (sign*res, rest) 
 
let get_number tokens =
  match tokens with
  | SPACE :: rest -> get_value rest 0 1
  | TAB :: rest -> get_value rest 0 (-1)
  | LINEFEED :: rest -> (0,rest)
  | [] -> Lexer.error("Number not defined")

let rec get_label tokens (res : string) = 
  match tokens with
  | SPACE :: rest -> get_label rest (res^"S")
  | TAB :: rest -> get_label rest (res^"T")
  | LINEFEED :: rest -> (res, rest)
  | [] -> Lexer.error("Label not ended")

let rec parse_instruction tokens output =
  match tokens with
  | [] -> List.rev output
  | SPACE :: SPACE :: rest -> begin 
    let (number, newRest) = get_number rest in 
    parse_instruction newRest (Push number :: output)
  end
  | SPACE :: LINEFEED :: SPACE :: rest -> parse_instruction rest (Dup :: output)
  | SPACE :: TAB :: SPACE :: rest -> begin
    let (number, newRest) = get_number rest in 
    if number < 0 then Lexer.error("Copy number negative") else parse_instruction newRest (Copy number :: output)
  end
  | SPACE :: LINEFEED :: TAB :: rest -> parse_instruction rest (Swap :: output)
  | SPACE :: LINEFEED :: LINEFEED :: rest -> parse_instruction rest (Discard :: output)
  | SPACE :: TAB :: LINEFEED :: rest -> begin
    let (number, newRest) = get_number rest in 
    if number < 0 then Lexer.error("Slide number negative") else parse_instruction newRest (Slide number :: output)
  end
  | TAB :: SPACE :: SPACE :: SPACE :: rest -> parse_instruction rest (Add :: output)
  | TAB :: SPACE :: SPACE :: TAB :: rest -> parse_instruction rest (Subtract :: output)
  | TAB :: SPACE :: SPACE :: LINEFEED :: rest -> parse_instruction rest (Multiply :: output)
  | TAB :: SPACE :: TAB :: SPACE :: rest -> parse_instruction rest (Divide :: output)
  | TAB :: SPACE :: TAB :: TAB :: rest -> parse_instruction rest (Modulo :: output)
  | TAB :: TAB :: SPACE :: rest -> parse_instruction rest (Store :: output)
  | TAB :: TAB :: TAB :: rest -> parse_instruction rest (Load :: output)
  | LINEFEED :: SPACE :: SPACE :: rest -> begin 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (Label label :: output)
  end
  | LINEFEED :: SPACE :: TAB :: rest -> begin 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (Call label :: output)
    end
  | LINEFEED :: SPACE :: LINEFEED :: rest -> begin 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (Jump label :: output)
  end
  | LINEFEED :: TAB :: SPACE :: rest -> begin 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (JumpIfZero label :: output)
  end
  | LINEFEED :: TAB :: TAB :: rest -> begin 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (JumpIfNeg label :: output)
  end
  | LINEFEED :: TAB :: LINEFEED :: rest -> parse_instruction rest (EndSub :: output)
  | LINEFEED :: LINEFEED :: LINEFEED :: rest -> parse_instruction rest (EndProg :: output)
  | TAB :: LINEFEED :: SPACE :: SPACE :: rest -> parse_instruction rest (OutputChar :: output)
  | TAB :: LINEFEED :: SPACE :: TAB :: rest -> parse_instruction rest (OutputNum :: output)
  | TAB :: LINEFEED :: TAB :: SPACE :: rest -> parse_instruction rest (ReadChar :: output)
  | TAB :: LINEFEED :: TAB :: TAB :: rest -> parse_instruction rest (ReadNum :: output)
  | _ -> Lexer.error("Wrong sequence of tokens")
