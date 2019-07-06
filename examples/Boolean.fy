# Simple implementation of Booleans

abstract type Boolean {
  and: Function<Boolean, Boolean>
  or: Function<Boolean, Boolean>
  not: Boolean
  xor: Function<Boolean, Boolean> := equals[other].not
}

type True: Boolean {
  not := False
  and[other] := other
  or[other] := True
}

type False: Boolean {
  not := True
  and[other] := False
  or[other] := other
}
