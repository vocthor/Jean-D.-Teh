use std::collections::HashMap;
use std::io;
use std::process;

fn main() {
    let mut w = Whitespace {
        stack: Vec::new(),
        memory: HashMap::new(),
        func_ref: Vec::new(),
    };
    w.run();
}

type Binop = fn(&mut Whitespace);
pub struct Whitespace {
    stack: Vec<i32>,
    memory: HashMap<i32, i32>,
    func_ref: HashMap<Binop, Vec<i32>>,
}

impl Whitespace {
    pub fn run(&mut self) {
        self.func_ref.push(Whitespace::s);
        let fct: Binop = self.func_ref.pop().unwrap();
        fct(self);
    }
    fn s(&mut self) {
        self.stack.push(10);
        self.stack.push(65);
        print!("{}", self.stack.pop().unwrap() as u8 as char);
        print!("{}", self.stack.pop().unwrap() as u8 as char);


        call_0();
    }
}


CALL : 
    self.calls.push(Whitespace::call_%s);
    self.previousStacks.push(stack);
    self.%s();
    }
    fn call_%s(&mut self){ // call


ENDSUB : 
    let fct:  Binop = self.calls.pop().unwrap();
    self.stack = self.previousStacks.pop().unwrap();
    fct(self);