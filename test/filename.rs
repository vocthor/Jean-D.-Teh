use std::collections::HashMap;
use std::io;

use std::process;

fn main() {
	let mut stack : Vec<i32> = Vec::new();
	let mut memory: HashMap<i32, i32> = HashMap::new();

	main2(&mut stack, &mut memory);
}
fn main2(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
	stack.push(1); // push
	STSSSSTT(stack, memory);
}
fn STSSSSTT(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	let n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup
	println!("{}", stack.pop().unwrap()); // output num
	stack.push(10); // push
	println!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(1); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add
	let n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup
	stack.push(11); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a); // sub
	if stack.pop().unwrap() == 0 {STSSSTST(stack, memory);} // jump if zero
	STSSSSTT(stack, memory); // jump
	STSSSTST(stack, memory);
}
fn STSSSTST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	stack.pop(); // discard 
	process::exit(0); // end prog
	STTSSSSTSTTSSTSSSTTSSTSS(stack, memory);
}
fn STTSSSSTSTTSSTSSSTTSSTSS(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add
	return;
 //end sub routine
	STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTST(stack, memory);
}
fn STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	let n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	let n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup
	if stack.pop().unwrap() == 0 {STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTSTSTSTTTTTSTTSSTSTSTTSTTTSSTTSSTSS(stack, memory);} // jump if zero
	println!("{}", stack.pop().unwrap() as u8 as char); // output char
	stack.push(1); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add
	STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTST(stack, memory); // jump
	STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTSTSTSTTTTTSTTSSTSTSTTSTTTSSTTSSTSS(stack, memory);
}
fn STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTSTSTSTTTTTSTTSSTSTSTTSTTTSSTTSSTSS(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	stack.pop(); // discard 
	stack.pop(); // discard 
	return;
 //end sub routine
	STTTSSTSSTTSSTSTSTTSSSSTSTTSSTSS(stack, memory);
}
fn STTTSSTSSTTSSTSTSTTSSSSTSTTSSTSS(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	let n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup
	let n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup
	let mut input = String::new();io::stdin().read_line(&mut input).expect("Error: unable to read user char input");let addr: i32 = stack.pop().unwrap();memory.insert(addr,input.chars().nth(0).unwrap() as i32); // read char
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	let n = stack.pop().unwrap(); stack.push(n); stack.push(n); // dup
	stack.push(10); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a); // sub
	if stack.pop().unwrap() == 0 {STTTSSTSSTTSSTSTSTTSSSSTSTTSSTSSSTSTTTTTSTTSSTSTSTTSTTTSSTTSSTSS(stack, memory);} // jump if zero
	stack.pop(); // discard 
	stack.push(1); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add
	STTTSSTSSTTSSTSTSTTSSSSTSTTSSTSS(stack, memory); // jump
	STTTSSTSSTTSSTSTSTTSSSSTSTTSSTSSSTSTTTTTSTTSSTSTSTTSTTTSSTTSSTSS(stack, memory);
}
fn STTTSSTSSTTSSTSTSTTSSSSTSTTSSTSSSTSTTTTTSTTSSTSTSTTSTTTSSTTSSTSS(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	stack.pop(); // discard 
	stack.push(1); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b + a); // add
	stack.push(0); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	return;
 //end sub routine
	STTSTTTSSTTSSTSTSTTTSTTTSTTSTTSSSTTSTSSTSTTSTTTSSTTSSTST(stack, memory);
}
fn STTSTTTSSTTSSTSTSTTTSTTTSTTSTTSSSTTSTSSTSTTSTTTSSTTSSTST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	stack.push(10); // push
	stack.push(13); // push
	println!("{}", stack.pop().unwrap() as u8 as char); // output char
	println!("{}", stack.pop().unwrap() as u8 as char); // output char
	return;
 //end sub routine
}