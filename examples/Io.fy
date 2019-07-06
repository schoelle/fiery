abstract type Io {
}

type PrintLine[line]: Io {
  line: String
}

type Exit[code]: Io {
  code: Integer
}
