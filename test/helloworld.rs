use std::collections::HashMap;
use std::io;

use std::process;

fn main() {
	let mut stack : Vec<i32> = Vec::new();
	let mut memory: HashMap<i32, i32> = HashMap::new();

	main2(&mut stack, &mut memory);
}
fn main2(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
	stack.push(72); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(101); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(108); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(108); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(111); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(32); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(119); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(111); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(114); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(108); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(100); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(33); // push
	print!("{}", stack.pop().unwrap() as u8 as char); // output char
	process::exit(0); // end prog
}