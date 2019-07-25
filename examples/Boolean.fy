# Simple implementation of Booleans

abstract type Boolean {
  and: Function<Boolean, Boolean>
  or: Function<Boolean, Boolean>
  not: Boolean
  xor: Function<Boolean, Boolean> := equals[other].not
}

type True: Boolean {
  not := False
  and := fun other: other
  or := fun other: True
}

type False: Boolean {
  not := True
  and := fun other: False
  or := fun other: other
}
