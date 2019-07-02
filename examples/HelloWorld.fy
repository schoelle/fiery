type Main: Program {
  step[state] := Io.exit[0][Io.print["Hello World!"][state]]
}