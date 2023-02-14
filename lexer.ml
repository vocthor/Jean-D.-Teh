type token =
| SPACE
| TAB
| LINEFEED
| EOF

let print = function
| SPACE -> Printf.printf "SPACE\n"
| TAB -> Printf.printf "TAB\n"
| LINEFEED -> Printf.printf "LINEFEED\n"
| EOF -> Printf.printf "EOF\n"

exception Lexical_error of string

let line_number = ref 0

let newline () = incr line_number

let error msg = raise (Lexical_error (msg ^ " at line " ^ string_of_int !line_number))

let rec get_token stream =
  try
    let next () = Stream.next stream in
    let char_to_string c = String.make 1 c in
    match next() with
    |'S' -> SPACE
    |'T' -> TAB
    |'L' -> LINEFEED
    | _ as c -> error("char non reconnu : " ^ char_to_string c)
  with Stream.Failure -> EOF
