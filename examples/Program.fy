abstract type Program {
  step: Function<State, List<Op>>
}
