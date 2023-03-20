open Type

let rec get_token stream output =
  try
    let next () = Stream.next stream in
    match next() with
    |' ' -> get_token stream (SPACE :: output)
    |'\t' -> get_token stream (TAB :: output)
    |'\n' -> get_token stream (LINEFEED :: output)
    | _ -> get_token stream output
  with Stream.Failure -> List.rev output