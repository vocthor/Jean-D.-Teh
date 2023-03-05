use std::io;

fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: Vec<i32> = Vec::new();

    stack.push(75); // push
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(119); // push
    print!("{}", stack.pop().unwrap() as u8 as char); // output char
    stack.push(10); // push
    print!("{}", stack.pop().unwrap() as u8 as char); // output char

    let c = io::stdin().bytes().next().unwrap().unwrap();
    stack.push(c as i32);
}
