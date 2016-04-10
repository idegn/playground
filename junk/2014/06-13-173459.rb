# -*- coding: undecided -*-
#atcoder arc 001 b
a,B = gets.split.map(&:to_i)
arr = [10, 5, 1]

# count = 0
# while a != B
#   sym = B > a ? 1 : -1

#   t = (B-a)*sym
  
#   #a += sym * arr.inject {|r,x| (t-r).abs < (t-x).abs ? r : x}
#   a += sym * arr.min_by{|x| (t-x).abs}

#   count += 1
# end

# puts count

# exit

########

# count = 0
# a = (a-B).abs
# while a != 0
#   a = (a - arr.inject {|r,x| (a-r).abs < (a-x).abs ? r : x}).abs
#   count += 1
# end

# puts count

##########

# def waru(d ,arr)  
#   head = arr.first
#   rest = arr.drop(1)
  
#   c = d / head
#   return c if arr.size == 1
  
#   [c + waru(d - head*c, rest),
#    (c+1) + waru((d - head*(c+1)).abs, rest) ].min
# end

# puts waru((a-B).abs, arr)

##############
#issue カウントできない

# ab = (a-B).abs
# arr.inject([ab,0]){|arr, x|
#   d = arr.first
#   c = d / x
#   [d - c*x, (d - (c+1)*d).abs].min
# }

