#euler 23
def divisors(num)
  sqrt = Math.sqrt(num)
  ans = (2..sqrt).select { |i| num%i == 0 }
  ans += ans.map { |i| num/i }
  ans << 1
  ans.uniq
end

LIMIT = 28123.freeze
#LIMIT = 30
ABUNDANT_NUMBERS = (1..LIMIT).select { |i| divisors(i).reduce(:+) > i }.sort.freeze
AN = ABUNDANT_NUMBERS
AN_COUNT = ABUNDANT_NUMBERS.count.freeze
#p ABUNDANT_NUMBERS #

def can_make?(num)
  # 案1:遅すぎ終わらない
  # half = num/2
  # return true if ABUNDANT_NUMBERS.include?(half)

  # _, border_idx = ABUNDANT_NUMBERS.each_with_index.to_a.bsearch { |(i, _)| i >= half }
  # l_group, h_group = ABUNDANT_NUMBERS[0..border_idx], ABUNDANT_NUMBERS[border_idx+1..-1].reverse
  
  # l_group.any? { |i|
  #   break false if num < i
  #   h_group.any? { |j|
  #     break false if i + j < num
  #     i + j == num
  #   }
  # }

  # 案2:10秒
  j = AN_COUNT-1
  (0..AN_COUNT).each do |i|
    sum = AN[i] + AN[j]
    return true if sum == num
    return false if j < i
    if num < sum 
      j -= 1
      redo
    end
  end
end


#p can_make?(24) #
#p (1..LIMIT).reject { |i| can_make?(i) }.reduce(:+)

# 案3:答え見た
flags = []
n = AN_COUNT-1
(0..n).each do |i|
  (i..n).each do |j|
    sum = AN[i] + AN[j]
    if sum <= LIMIT
      flags[sum] = true
    else
      break
    end
  end
end
p flags.each_with_index.reduce(0) {|acc, (flag, idx)| flag ? acc : acc + idx }
