fn main() {
    print!("Hello\n");
    let n: i32 = world(32);
    println!("{}", n);


    let mut stack : Vec<i32> = Vec::new();
    println!("len = {}", stack.len());
    ttt(&mut stack);
    println!("len = {}", stack.len());
}

fn world(mut nb: i32) -> i32 {
    if true {
        print!("world\n");
    } else {
        print!("world !\n");
    }
    nb += 1;
    return nb;
}

fn ttt(stack: &mut Vec<i32>) {
    stack.push(34);
    println!("len in = {}", stack.len());
}
