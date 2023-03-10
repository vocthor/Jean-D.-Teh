type Binop = fn(i32, i32) -> i32;
static mut stack: Vec<Binop> = Vec::new();
fn main() {
    unsafe {
        stack.push(add);
        stack.push(min);
        stack.push(mul);
        stack.push(div);
        for _ in 0..stack.len() {
            let func = stack.pop().unwrap();
            let res = func(5, 3);
            println!("{}", res);
        }
        // stack.iter().for_each(|x| print!("{}\n", x(5,3)));
    }
}

fn add(a: i32, b: i32) -> i32 {
    return a + b;
}

fn mul(a: i32, b: i32) -> i32 {
    return a * b;
}

fn div(a: i32, b: i32) -> i32 {
    return a / b;
}

fn min(a: i32, b: i32) -> i32 {
    return a - b;
}
