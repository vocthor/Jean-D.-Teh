let load_file f =
  let ic = open_in f in
  let n = in_channel_length ic in
  let s = Bytes.create n in
    really_input ic s 0 n;
    close_in ic;
    s

exception Args_error of string

let main () =
  let filenames = ref [] in
  let specs = [] in
  let add_to_filenames = fun s -> filenames := s :: !filenames in
  Arg.parse specs add_to_filenames "Usage: prolog filename";
  let wsfilename = if (List.length !filenames) > 1 then raise (Args_error "Too many arguments, usage : ./main.native file.ws") else List.nth !filenames 0 in 
  let stream = load_file wsfilename |> Bytes.to_string |> Stream.of_string in

  let tokens = Lexer.get_token stream [] in 
  (* List.map Type.print_token tokens; *)
  
  let instructions = Parser.parse_instruction tokens [] in 
  (* List.map Type.print_instruction instructions; *)
  
  let regex = Str.regexp {|.ws|} in 
  let rsfilename = Str.replace_first regex {|.rs|} wsfilename in
  let oc = open_out rsfilename in
  Printf.fprintf oc "use std::collections::HashMap;\n";
  Printf.fprintf oc "use std::io;\n\n";
  Printf.fprintf oc "use std::process;\n\n";
  Printf.fprintf oc "fn main() {\n";
  Printf.fprintf oc "\ttype Binop = fn(&mut Vec<i32>, &mut HashMap<i32, i32>);";
  Printf.fprintf oc "\tlet mut func_refs : Vec<Binop> = Vec::new();\n";
  Printf.fprintf oc "\tlet mut stack : Vec<i32> = Vec::new();\n";
  Printf.fprintf oc "\tlet mut memory: HashMap<i32, i32> = HashMap::new();\n\n";
  Printf.fprintf oc "\tmain2(&mut stack, &mut memory);\n}\n";
  Printf.fprintf oc "fn main2(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {\n";
  Traductor.trad_instructions instructions oc ;
  close_out oc

let _ = main ()