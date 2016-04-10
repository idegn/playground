# -*- coding: utf-8 -*-
#paiza
# x,y = gets.split
# puts x == y ? "True" : "False"

#puts gets.split.max

# (gets.to_i).times do
#   arr = gets.split(".")
#   puts (arr.include?("") or arr.map(&:to_i).select{|item| 0 <= item and item <= 255}.count != 4) ? "False" : "True"
# end

# values = Hash.new
# (gets.to_i).times do
#   index,value =gets.split
#   values[index] = value.to_i
# end

# puts gets.split.inject(0){|res,item|
#   term = 0
#   item.each_char { |c| term += (1.0/values[c]) } #FIXME 直列の場合場合わけないと誤差る
#   res + (1/term)
# }.to_i


