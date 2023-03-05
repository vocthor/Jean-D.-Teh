use std::collections::HashMap;
use std::io;

fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: HashMap<i32, i32> = HashMap::new();

    stack.push(35);
    stack.push(65);

    let val: i32 = stack.pop().unwrap();
    let addr: i32 = stack.pop().unwrap();
    memory.insert(addr, val); // store

    let addr2: i32 = stack.pop().unwrap();
    let val2: i32 = memory[&addr];
    stack.push(val2);
    // let mut input = String::new();
    // io::stdin()
    //     .read_line(&mut input)
    //     .expect("Error: unable to read user char input");
    // let addr: i32 = stack.pop().unwrap();
    // memory.insert(addr, input.chars().nth(0).unwrap() as i32);

    println!("{}", memory[&addr]);
    print!("{}\n", memory[&addr] as u8 as char);

    // let addr = stack.pop().unwrap() as usize;
    // memory[addr] = input.chars().nth(0).unwrap() as i32;
    // println!("{}", memory[addr]);
    // // println!("{}", input.chars().nth(0).unwrap().parse::<i32>().unwrap());
}
