use std::collections::HashMap;
use std::io;

fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: HashMap<i32, i32> = HashMap::new();

    S(&mut stack, &mut memory);
}
fn S(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
    // println!("in S");
    // label
    stack.push(1); // push
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Error: unable to read user char input");
    let addr: i32 = stack.pop().unwrap();
    memory.insert(addr, input.chars().nth(0).unwrap() as i32); // read char
    stack.push(1); // push
    // println!("pushed");
    let addr = stack.pop().unwrap();
    let val = memory[&addr];
    stack.push(val); // load
    println!("{}", stack.pop().unwrap() as u8 as char); // output char
    stack.push(1); // push
    let addr = stack.pop().unwrap();
    let val = memory[&addr];
    stack.push(val); // load
    if stack.pop().unwrap() as u8 as char == '0' {
        T(stack, memory);
    } // jump if zero
    S(stack,memory); // jump
    T(stack, memory);
}
fn T(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) { // label
}
