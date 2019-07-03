abstract type Ordered {
  smallerThan: Function<Ordered, Boolean>
  largerThan[other]: Function<Ordered, Boolean> := other.smallerThan[this]
  smallerOrEqualThan: Function<Ordered, Boolean> := equal[other].or[smallerThan[other]]
  largerOrEqualThan: Function<Ordered, Boolean> := equal[other].or[largerThan[other]]
}
