abstract type Program: Any {
  step: Function<State, State>
}
