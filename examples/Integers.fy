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

type PositiveNumber[decrement]: Integer {
  increment := PositiveNumber[this]
  isZero := False
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
  smallerThan[other] := match other {
    PositiveNumber -> decrement.smallerThan[other.decrement]
    NegativeNumber -> False
    Zero -> False
  }
}

type NegativeNumber[increment]: Integer {
  decrement := NegativeNumber[this]
  isZero := False
  plus[other] := match other {
    PositiveNumber -> plus[other.increment].decrement
    NegativeNumber -> plus[other.decrement].increment
    Zero -> this
  }
  minus[other] := match other {
    PositiveNumber -> minus[other.descrement].decrement
    NegativeNumber -> minus[other.increment].increment
    Zero -> this
  }
  smallerThan[other] := match other {
    PositiveNumber -> decrement.smallerThan[other.decrement]
    NegativeNumber -> False
    Zero -> False
  }
}
