let load_file f =
  let ic = open_in f in
  let n = in_channel_length ic in
  let s = Bytes.create n in
    really_input ic s 0 n;
    close_in ic;
    s

let concat_files filenames =
  List.map load_file filenames
  |> Bytes.concat Bytes.empty
  |> Bytes.to_string

let main () =
  let filenames = ref [] in
  let specs = []
  and add_to_filenames = fun s -> filenames := s :: !filenames in
  Arg.parse specs add_to_filenames "Usage: prolog filename";
  let stream = concat_files !filenames |> Stream.of_string in

  let tokens = Lexer.get_token stream [] in 
  (* List.map Type.print_token tokens; *)
  
  let instructions = Parser.parse_instruction tokens [] in 

  List.map Type.print_instruction instructions


let _ = main ()
