abstract type Integer: Ordered {
  increment: Integer
  decrement: Integer
  isZero: Boolean
  plus: Function<Integer, Integer>
  minus: Function<Integer, Integer>
  negated: Integer
}

type Zero: Integer {
  increment := PositiveNumber[this]
  decrement := NegativeNumber[this]
  isZero := True
  plus[other] := other
  minus[other] := other.negated
  negated := this
  smallerThan[other] := match other {
    PositiveNumber -> True
    NegativeNumber -> False
    Zero -> False
  }
}

abstract type NonZeroInteger: Integer {
  plus[other] := match other {
    PositiveNumber -> plus[other.descrement].increment
    NegativeNumber -> plus[other.increment].decrement
    Zero -> this
  }
  minus[other] := match other {
    PositiveNumber -> minus[other.descrement].decrement
    NegativeNumber -> minus[other.increment].increment
    Zero -> this
  }
}

type PositiveNumber[decrement]: NonZeroInteger {
  increment := PositiveNumber[this]
  isZero := False
  smallerThan[other] := match other {
    PositiveNumber -> decrement.smallerThan[other.decrement]
    NegativeNumber -> False
    Zero -> False
  }
  negated := decrement.negated.decrement
}

type NegativeNumber[increment]: NonZeroInteger {
  decrement := NegativeNumber[this]
  isZero := False
  smallerThan[other] := match other {
    PositiveNumber -> True
    NegativeNumber -> increment.smallerThan[other.increment]
    Zero -> False
  }
  negated := increment.negated.increment
}
