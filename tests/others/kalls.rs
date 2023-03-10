use std::collections::HashMap;

type Binop = fn(&mut Vec<Binop>, &mut Vec<i32>, &mut HashMap<i32, i32>);
fn main() {
    let mut stack: Vec<i32> = Vec::new();
    let mut memory: HashMap<i32, i32> = HashMap::new();
    let mut refs: Vec<Binop> = Vec::new();
    refs.push(affiche);

    print!("Hello ");
    let func = refs.pop().unwrap();
    func(&mut stack, &mut memory);
}

fn affiche(refs: &mut Vec<Binop>, stack: &mut Vec<i32>, memory: &mut HashMap<i32, i32>) {
    println!("world !");
}
