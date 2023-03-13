open Type

let rec get_token stream output =
  try
    let next () = Stream.next stream in
    match next() with
    |'S' -> get_token stream (SPACE :: output)
    |'T' -> get_token stream (TAB :: output)
    |'\n' -> get_token stream (LINEFEED :: output)
    | _ -> get_token stream output
  with Stream.Failure -> List.rev output