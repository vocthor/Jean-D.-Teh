use std::collections::HashMap;
use std::io::stdout;
use std::io::Write;

fn main() {
    print!("Hello ");
    stdout().flush().unwrap();
    print!("world !");
}
