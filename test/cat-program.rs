use std::collections::HashMap;
use std::io;

use std::process;

fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: HashMap<i32, i32> = HashMap::new();

    main2(&mut stack, &mut memory);
}
fn main2(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
    s(stack, memory);
}
fn s(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
    // label
    stack.push(1); // push
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Error: unable to read user char input");
    let addr: i32 = stack.pop().unwrap();
    memory.insert(addr, input.chars().nth(0).unwrap() as i32); // read char
    stack.push(1); // push
    let addr = stack.pop().unwrap();
    let val = memory[&addr];
    stack.push(val); // load
    print!("{}", stack.pop().unwrap() as u8 as char); // output char
    stack.push(1); // push
    let addr = stack.pop().unwrap();
    let val = memory[&addr];
    stack.push(val); // load
    if stack.pop().unwrap() == 0 {
        t(stack, memory);
    } // jump if zero
    s(stack, memory); // jump
    t(stack, memory);
}
fn t(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
    // label
    process::exit(0); // end prog
}
