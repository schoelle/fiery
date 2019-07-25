abstract type Ordered {
  smallerThan: Function<Ordered, Boolean>
  largerThan: Function<Ordered, Boolean> := fun other: other.smallerThan[this]
  smallerOrEqualThan: Function<Ordered, Boolean> := fun other: equal[other].or[smallerThan[other]]
  largerOrEqualThan: Function<Ordered, Boolean> := fun other: equal[other].or[largerThan[other]]
}
