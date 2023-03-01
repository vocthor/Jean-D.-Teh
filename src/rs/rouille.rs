fn main() {
    let mut stack : Vec<i32> = Vec::new();
    let mut memory: Vec<i32> = Vec::new();

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
}