abstract type Integer: Ordered {
  increment: Integer
  decrement: Integer
  isZero: Boolean
  plus: Function<Integer, Integer>
  minus: Function<Integer, Integer>
  times: Function<Integer, Integer>
  div: Function<Integer, Integer>
  mod: Function<Integer, Integer>
  negated: Integer
  abs: Integer
  min: Function<Integer, Integer>
  max: Function<Integer, Integer>
}
