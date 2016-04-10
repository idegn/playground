LIMIT = 10_000
ans = (1..9).to_a.map(&:to_s)


p (1...LIMIT).to_a.reverse.find { |i|
  tmp = []
  (1..Float::INFINITY).find do |n|
    tmp += (i * n).to_s.chars
    9 <= tmp.count
  end
  ans == tmp.sort
}
 
