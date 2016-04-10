#euler 26
range = Array(2...1000)
ans = 0
range.reverse.each do |i|
  rest = 1
  memo = []

  (i-1).times do 
    rest = (rest * 10) % i
    break if memo.include?(rest)
    memo << rest 
      
    if rest == 0
      memo = []
      break
    end
  end

  ans = [ans, memo.count].max
  break if ans == i - 1
end

p ans+1
