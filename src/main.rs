use std::io::prelude::*;
use std::io::BufReader;
use std::fs::File;
use scanner;

fn main() -> std::io::Result<()> {
    let f = File::open("examples/Boolean.fy")?;
    let mut reader = BufReader::new(f);
    let mut data = String::new();
    let _len = reader.read_to_string(&mut data)?;
    scanner::set_input(data.chars());
    Ok(())
}
