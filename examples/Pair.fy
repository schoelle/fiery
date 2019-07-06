type Pair<A, B>[first][second] {
  first: A
  second: B
  swap: Pair<B, A> := Pair<B, A>[second][first]
}