type Pair<A=Any, B=Any>[first][second] {
  first: A
  second: B
  swap: Pair<B, A> := Pair<B, A>[second][first]
}