#愚直、なんか実行終わらなかった
#$pentagonal_numbers = [1,5]
#
#def make_pnums(target)
#  n = $pentagonal_numbers.count + 1
#  while $pentagonal_numbers.last < target
#    $pentagonal_numbers << (n * (3*n - 1)) / 2
#    n += 1
#  end
#end
#    
#def check_pair(k, j)
#  sum = k + j
#  diff = (k - j).abs
#  make_pnums(sum)
#  return false unless $pentagonal_numbers.include?(diff)
#  $pentagonal_numbers.include?(sum) ? diff : false
#end
#
#answer = nil
#checked_index = 0
#diff_between_next = 4
#while answer.nil? or diff_between_next < answer 
#  j = $pentagonal_numbers[checked_index + 1]
#  #p $pentagonal_numbers[0..checked_index]
#  $pentagonal_numbers[0..checked_index].each do |k|
#    #p [k,j]
#    if t = check_pair(k,j)
#      answer = t if answer.nil? or t < answer
#    end
#  end
#  checked_index += 1
#  diff_between_next = 3 * (checked_index + 1) + 1
#  #p diff_between_next
#end
#
#p answer

#こたえみた
def is_pentagonal?(t)
  n = (1 + Math.sqrt(1 + 24*t)) / 6
  n == n.to_i
end

ans = nil
i = 1
while ans.nil?
  i += 1
  b = (i * (3*i - 1)) / 2

  (1...i).to_a.reverse.each { |j|
    a = (j * (3*j - 1)) / 2
    if is_pentagonal?(a + b) and is_pentagonal?(b - a)
      ans = b - a
      break
    end
  }
end
p ans

