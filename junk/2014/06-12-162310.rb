R,C,D = gets.split.map(&:to_i)

arr = Array.new
# R.times do 
#   arr.push gets.split.map(&:to_i)
# end
arr = STDIN.to_a.map { |l| l.split.map(&:to_i) }

 
mx = 0
arr.each_index { |i|
  break if D < i
  
  ((D+i)%2).step(arr[i].size-1,2){ |j|
    t = i+j
    break if D < t
    mx = [mx,arr[i][j]].max
  }
}

puts mx

