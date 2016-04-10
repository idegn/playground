# -*- coding: utf-8 -*-
# L = gets.to_i

# arr = Array.new
# L.times do |i|
#   # arr << gets.chomp.to_i
#   arr[i] = gets.chomp.to_i
# end

# arr = L.times.map{gets.to_i}

# p arr

a = $<.map(&:to_i)
#p a.read #ctrl-d 二回で終わる ;;$<はARGFの別名
p a



#arr = $<

#p arr

7
1 2 1 3 1 4 4

# arr = [1, 3, 5, 7, 8]
# p arr.bsearch{|x| x == 5}
