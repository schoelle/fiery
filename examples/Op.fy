abstract type Op {
}

type PrintLine[line]: Op {
  line: String
}

type Exit[code]: Op {
  code: Integer
}
