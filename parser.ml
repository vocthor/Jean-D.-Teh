open Type

exception Parsing_error of string

let line_number = ref 1

let newline () = incr line_number

let error msg = raise (Parsing_error (msg ^ " at line " ^ string_of_int !line_number))

let rec get_value tokens res sign =
  match tokens with
  | [] -> error("Number not ended")
  | SPACE :: rest -> get_value rest (res*2) sign
  | TAB :: rest -> get_value rest (res*2 + 1) sign
  | LINEFEED :: rest -> newline () ; (sign*res, rest) 
 
let get_number tokens =
  match tokens with
  | SPACE :: rest -> get_value rest 0 1
  | TAB :: rest -> get_value rest 0 (-1)
  | LINEFEED :: rest -> newline () ; (0,rest)
  | [] -> error("Number not defined")

let rec get_label tokens (res : string) = 
  match tokens with
  | SPACE :: rest -> get_label rest (res^"s")
  | TAB :: rest -> get_label rest (res^"t")
  | LINEFEED :: rest -> newline () ; (res, rest)
  | [] -> error("Label not ended")

let rec parse_instruction tokens output =
  match tokens with
  | [] -> List.rev output
  | SPACE :: SPACE :: rest -> begin 
    let (number, newRest) = get_number rest in 
    parse_instruction newRest (Push number :: output)
  end
  | SPACE :: LINEFEED :: SPACE :: rest -> newline () ; parse_instruction rest (Dup :: output)
  | SPACE :: TAB :: SPACE :: rest -> begin
    let (number, newRest) = get_number rest in 
    if number < 0 then error("Copy number negative") else parse_instruction newRest (Copy number :: output)
  end
  | SPACE :: LINEFEED :: TAB :: rest -> newline () ; parse_instruction rest (Swap :: output)
  | SPACE :: LINEFEED :: LINEFEED :: rest -> newline () ; newline () ; parse_instruction rest (Discard :: output)
  | SPACE :: TAB :: LINEFEED :: rest -> begin
    newline () ;
    let (number, newRest) = get_number rest in 
    if number < 0 then error("Slide number negative") else parse_instruction newRest (Slide number :: output)
  end
  | TAB :: SPACE :: SPACE :: SPACE :: rest -> parse_instruction rest (Add :: output)
  | TAB :: SPACE :: SPACE :: TAB :: rest -> parse_instruction rest (Sub :: output)
  | TAB :: SPACE :: SPACE :: LINEFEED :: rest -> newline () ; parse_instruction rest (Mult :: output)
  | TAB :: SPACE :: TAB :: SPACE :: rest -> parse_instruction rest (Div :: output)
  | TAB :: SPACE :: TAB :: TAB :: rest -> parse_instruction rest (Mod :: output)
  | TAB :: TAB :: SPACE :: rest -> parse_instruction rest (Store :: output)
  | TAB :: TAB :: TAB :: rest -> parse_instruction rest (Load :: output)
  | LINEFEED :: SPACE :: SPACE :: rest -> begin 
    newline () ;
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (Label label :: output)
  end
  | LINEFEED :: SPACE :: TAB :: rest -> begin
    newline () ; 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (Call label :: output)
    end
  | LINEFEED :: SPACE :: LINEFEED :: rest -> begin
    newline () ; 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (Jump label :: output)
  end
  | LINEFEED :: TAB :: SPACE :: rest -> begin
    newline () ; 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (JumpIfZero label :: output)
  end
  | LINEFEED :: TAB :: TAB :: rest -> begin
    newline () ; 
    let (label, newRest) = get_label rest "" in 
    parse_instruction newRest (JumpIfNeg label :: output)
  end
  | LINEFEED :: TAB :: LINEFEED :: rest -> newline () ; newline () ; parse_instruction rest (EndSub :: output)
  | LINEFEED :: LINEFEED :: LINEFEED :: rest -> newline () ; newline () ; newline () ; parse_instruction rest (EndProg :: output)
  | TAB :: LINEFEED :: SPACE :: SPACE :: rest -> newline () ; parse_instruction rest (OutputChar :: output)
  | TAB :: LINEFEED :: SPACE :: TAB :: rest -> newline () ; parse_instruction rest (OutputNum :: output)
  | TAB :: LINEFEED :: TAB :: SPACE :: rest -> newline () ; parse_instruction rest (ReadChar :: output)
  | TAB :: LINEFEED :: TAB :: TAB :: rest -> newline () ; parse_instruction rest (ReadNum :: output)
  | _ -> error("Wrong sequence of tokens")
