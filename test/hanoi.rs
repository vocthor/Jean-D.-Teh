use std::collections::HashMap;
use std::io;

use std::process;

fn main() {
	let mut stack : Vec<i32> = Vec::new();
	let mut memory: HashMap<i32, i32> = HashMap::new();

	main2(&mut stack, &mut memory);
}
fn main2(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
	stack.push(0); // push
	stack.push(69); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(1); // push
	stack.push(110); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(2); // push
	stack.push(116); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(3); // push
	stack.push(101); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(4); // push
	stack.push(114); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(5); // push
	stack.push(32); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(6); // push
	stack.push(97); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(7); // push
	stack.push(32); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(8); // push
	stack.push(110); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(9); // push
	stack.push(117); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(10); // push
	stack.push(109); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(11); // push
	stack.push(98); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(12); // push
	stack.push(101); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(13); // push
	stack.push(114); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(14); // push
	stack.push(58); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(15); // push
	stack.push(32); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(16); // push
	stack.push(0); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(20); // push
	stack.push(32); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(21); // push
	stack.push(45); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(22); // push
	stack.push(62); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(23); // push
	stack.push(32); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(24); // push
	stack.push(0); // push
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(0); // push
	STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTST(stack, memory);
}
fn STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // call
	stack.push(100); // push
READ NUM TODO
	stack.push(100); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(1); // push
	stack.push(3); // push
	stack.push(2); // push
	STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack, memory);
}
fn STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // call
	process::exit(0); // end prog
	STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack, memory);
}
fn STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	stack.push(103); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(102); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(101); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(100); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(100); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	if stack.pop().unwrap() == 0 {STTSSTSTSTTSTTTSSTTSSTSSSTTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack, memory);} // jump if zero
	stack.push(100); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(101); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(102); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(103); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(100); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(1); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a); // sub
	stack.push(101); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(103); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(102); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack, memory);
}
fn STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // call
	stack.push(103); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(102); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(101); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(100); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(101); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	println!("{}", stack.pop().unwrap()); // output num
	stack.push(20); // push
	STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTST(stack, memory);
}
fn STTTSTTTSTTTSSTSSTTSTSSTSTTTSTSSSTTSSTST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // call
	stack.push(102); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	println!("{}", stack.pop().unwrap()); // output num
	STTSTTTSSTTSSTSTSTTTSTTTSTTSTTSSSTTSTSSTSTTSTTTSSTTSSTST(stack, memory);
}
fn STTSTTTSSTTSSTSTSTTTSTTTSTTSTTSSSTTSTSSTSTTSTTTSSTTSSTST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // call
	stack.push(100); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(101); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(102); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(103); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(100); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(1); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b - a); // sub
	stack.push(103); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(102); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	stack.push(101); // push
	let addr = stack.pop().unwrap(); let val = memory[&addr]; stack.push(val); // load
	STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack, memory);
}
fn STTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // call
	stack.push(103); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(102); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(101); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	stack.push(100); // push
	let a = stack.pop().unwrap(); let b = stack.pop().unwrap(); stack.push(b); stack.push(a); // swap
	let val: i32 = stack.pop().unwrap();let addr: i32 = stack.pop().unwrap();memory.insert(addr, val); // store
	STTSSTSTSTTSTTTSSTTSSTSSSTTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack, memory);
}
fn STTSSTSTSTTSTTTSSTTSSTSSSTTSTSSSSTTSSSSTSTTSTTTSSTTSTTTTSTTSTSST(stack : &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
	return;
 //end sub routine
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