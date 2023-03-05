fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: Vec<i32> = Vec::new();

    stack.push(8); // push
    stack.push(2); // push
    let a = stack.pop().unwrap();
    let b = stack.pop().unwrap();
    stack.push(b + a); // add
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(8); // push
    stack.push(2); // push
    let a = stack.pop().unwrap();
    let b = stack.pop().unwrap();
    stack.push(b - a); // sub
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(8); // push
    stack.push(2); // push
    let a = stack.pop().unwrap();
    let b = stack.pop().unwrap();
    stack.push(b * a); // mult
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(8); // push
    stack.push(2); // push
    let a = stack.pop().unwrap();
    let b = stack.pop().unwrap();
    stack.push(b / a); // div
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(8); // push
    stack.push(2); // push
    let a = stack.pop().unwrap();
    let b = stack.pop().unwrap();
    stack.push(b % a); // mod
    println!("{}", stack.pop().unwrap()); // output num
}
