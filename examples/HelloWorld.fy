type Main: Program {
  step[state] := state.do[Print["Hello World"]].do[Exit[0]]
}