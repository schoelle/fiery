# Linked lists

abstract type List<T=Any> {
  head: T
  isEmpty: Boolean
  tail: List<T>
  length: Integer
  last: T
  add: Function<T, List<T>>
  append: Function<List<T>, List<T>>
  prepend: Function<List<T>, List<T>>
  reversed: List<T>
}

type EmptyList<=T>: List<=T> {
  head := Undefined
  tail := Undefined
  isEmpty := True
  length := 0
  last := Undefined
  add := fun e: ListElement<T>[e, EmptyList<T>]
  append := fun l: l
  prepend := fun l: l
  reversed := EmptyList<T>
}

type ListElement<=T>[head, tail]: List<=T> {
  isEmpty := False
  length := tail.length.add[1]
  last := match tail {
    EmptyList<T> -> head
    ListElement<T> -> tail.last
  }
  add := fun e: ListElement<T>[head,tail.add[e]]
  append := fun l: match tail {
    EmptyList<T> -> ListElement<T>[head,l]
    ListElement<T> -> ListElement<T>[head,tail.append[l]]
  }
  prepend := fun l: l.append[this]
  reversed := match tail {
    EmptyList<T> -> this
    ListElement<T> -> tail.revered.append[head]
  }
}
