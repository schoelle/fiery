abstract type Mapping<K=Any, V=Any> {
  set: Function<K, Function<V, Mapping<K,V>>
  get: Function<K, V>
}