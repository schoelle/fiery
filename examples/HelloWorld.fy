type Main: Program {
  step := fun state: EmptyList<Op>.add[Print["Hello World"]].add[Exit[0]]
}