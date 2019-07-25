type MergeSort<T-Ordered> {
  sorted: Function<List<T>, List<T>> := fun l:
    let
      p: Pair<List<T>, List<T>> := this.split[l]
      l1: List<T> := p.first
      l2: List<T> := p.second
      s1: List<T> := match l1 {
        EmptyList<T> := l1
	ListElement<T> := this.sorted[l1]
      }
      s2: List<T> := match l2 {
        EmptyList<T> := l2
	ListElement<T> := this.sorted[l2]
      }
    in
      this.merged[l1][l2]

  merged: Function<List<T>, Function<List<T>, List<T>> :=
    fun l1: fun l2:
      match l1 {
        EmptyList<T> -> l2
        ListElement<T> ->
	  match l2 {
	    EmptyList<T> -> l1
	    ListElement<T> ->
	      if l1.head.smallerThan[l2.head] then
	        this.merged[l1.tail][l2].add[l1.head]
	      else
                this.merged[l1][l2.tail].add[l2.head]
	      end
	  }
      }
}