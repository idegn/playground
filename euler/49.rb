require 'prime'

RANGE = 1000..9999

found = false
counter = Hash.new { Array.new }
RANGE.select { |i| Prime.prime? i }.each do |i|
  idx = i.to_s.chars.sort

  break if found
  counter[idx].each do |j|
    k = 2 * i - j
    kdx = k.to_s.chars.sort
    if Prime.prime?(k) and kdx == idx and kdx != 1487.to_s.chars.sort and k < 10000
      puts [j,i,k].map(&:to_s).reduce(:+)
      found = true
      break
    end
  end
  counter[idx] = counter[idx] << i
end

