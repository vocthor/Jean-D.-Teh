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
  let oc = open_out "./test/filename.rs" in
  let filenames = ref [] in
  let specs = []
  and add_to_filenames = fun s -> filenames := s :: !filenames in
  Arg.parse specs add_to_filenames "Usage: prolog filename";
  let stream = concat_files !filenames |> Stream.of_string in

  let tokens = Lexer.get_token stream [] in 
  (* List.map Type.print_token tokens; *)

  let instructions = Parser.parse_instruction tokens [] in 
  (* List.map Type.print_instruction instructions; *)

  Printf.fprintf oc "use std::collections::HashMap;\n";
  Printf.fprintf oc "use std::io;\n\n";
  Printf.fprintf oc "fn main() {\n";
  Printf.fprintf oc "\tlet mut stack : Vec<i32> = Vec::new();\n";
  Printf.fprintf oc "\tlet mut memory: HashMap<i32, i32> = HashMap::new();\n\n";
  Printf.fprintf oc "\tmain2(&mut stack, &mut memory);\n}\n";
  Printf.fprintf oc "fn main2(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {\n";
  Traductor.trad_instructions instructions oc ;
  close_out oc

let _ = main ()