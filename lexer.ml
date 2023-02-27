open Type



exception Lexical_error of string

let line_number = ref 0

let newline () = incr line_number

let error msg = raise (Lexical_error (msg ^ " at line " ^ string_of_int !line_number))

let rec get_token stream output =
  try
    let next () = Stream.next stream in
    match next() with
    |'S' -> get_token stream (SPACE :: output)
    |'T' -> get_token stream (TAB :: output)
    |'\n' -> get_token stream (LINEFEED :: output)
    | _ -> get_token stream output
  with Stream.Failure -> List.rev output