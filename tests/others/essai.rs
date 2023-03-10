use std::collections::HashMap;
use std::io;

fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: HashMap<i32, i32> = HashMap::new();

    // let str = "123";
    // let num = str.parse::<i32>().unwrap();

    // println!("{}", num);

    stack.push(1); // push
    let mut input = String::new();io::stdin().read_line(&mut input).expect("Error: unable to read user char input");let addr: i32 = stack.pop().unwrap();input.pop();memory.insert(addr, input.parse::<i32>().unwrap()); // read char
    stack.push(1); // push
    let addr = stack.pop().unwrap();
    let val = memory[&addr];
    stack.push(val); // load
                     // println!("{}", stack.pop().unwrap() as u8 as char); // output char
    println!("{}", stack.pop().unwrap()); // output num

    // // println!("{}", input.chars().nth(0).unwrap().parse::<i32>().unwrap());
}
