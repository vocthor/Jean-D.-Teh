fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: Vec<i32> = Vec::new();

    stack.push(-21); // push
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(14); // push
    let n = stack.pop().unwrap();
    stack.push(n);
    stack.push(n); // dup
    println!("{}", stack.pop().unwrap()); // output num
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(1); // push
    stack.push(2); // push
    let a = stack.pop().unwrap();
    let b = stack.pop().unwrap();
    stack.push(b);
    stack.push(a); // swap
    println!("{}", stack.pop().unwrap()); // output num
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(5); // push
    stack.push(10); // push
    stack.pop(); // discard
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(5); // push
    stack.push(10); // push
    stack.push(-21); // push
    stack.push(14); // push
    let nth = stack[3 - 1];
    stack.push(nth); // copy
    println!("{}", stack.pop().unwrap()); // output num
    stack.push(5); // push
    stack.push(10); // push
    stack.push(-21); // push
    stack.push(14); // push
    let top = stack.pop().unwrap();
    for i in 0..2 {
        stack.pop();
    }
    stack.push(top); // slide
    println!("{}", stack.pop().unwrap()); // output num
    println!("{}", stack.pop().unwrap()); // output num
}
