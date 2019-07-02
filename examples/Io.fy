abstract type Io {
  print: Function<String, Function<State, State>>
  exit: Function<Integer, Function<State, State>>
}