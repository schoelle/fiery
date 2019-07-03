# Simple implementation of Booleans

abstract type Boolean {
  and: Function<Boolean,Boolean>
  or: Function<Boolean,Boolean>
  not: Boolean
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