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
  Printf.fprintf oc "use std::io;\n";
  Printf.fprintf oc "use std::process;\n";
  Printf.fprintf oc "use std::collections::HashMap;\n\n";
  Printf.fprintf oc "fn main() {\n";
  Printf.fprintf oc "\tlet mut ws = Whitespace {\n"; 
  Printf.fprintf oc "\t\tstack: Vec::new(),\n";
  Printf.fprintf oc "\t\tmemory: HashMap::new(),\n";
  Printf.fprintf oc "\t\tcalls: Vec::new(),\n";
  Printf.fprintf oc "\t};\n\tws.exec();\n}\n\n";
  Printf.fprintf oc "type Binop = fn(&mut Whitespace);\n\n";
  Printf.fprintf oc "pub struct Whitespace {\n";
  Printf.fprintf oc "\tstack: Vec<i32>,\n";
  Printf.fprintf oc "\tmemory: HashMap<i32,i32>,\n";
  Printf.fprintf oc "\tcalls: Vec<Binop>,\n}\n\n";
  Printf.fprintf oc "impl Whitespace {\n";
  Printf.fprintf oc "\tpub fn exec(&mut self){\n";
  Traductor.trad_instructions instructions oc ;
  close_out oc

let _ = main ()