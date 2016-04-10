ans = 0
N = 100
(1...N).each do |a|
  (1...N).each do |b|
    sum = (a ** b).to_s.chars.map(&:to_i).reduce(:+)
    ans = sum if ans < sum
  end
end

p ans
