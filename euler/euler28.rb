p (3..1001).select(&:odd?).reduce([1, 1]) { |(acc, pre), i|
  acc += (i - 1) * 10 + (pre ** 2) * 4
  pre = i
  [acc, pre]
}
