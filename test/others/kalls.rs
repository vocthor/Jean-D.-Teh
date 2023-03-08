use std::collections::HashMap;

fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: HashMap<i32, i32> = HashMap::new();
    type Binop = fn(&mut Vec<i32>, &mut HashMap<i32, i32>);
    let mut refs: Vec<Binop> = Vec::new();
    refs.push(affiche);

    print!("Hello ");
    let func = refs.pop().unwrap();
    func(&mut stack, &mut memory);
}

fn affiche(stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
    println!("world !");
}
