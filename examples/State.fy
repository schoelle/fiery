abstract type State: Any {
  do: Function<Io, State>
}
