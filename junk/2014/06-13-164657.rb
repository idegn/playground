#atcoder arc 21 a
arr = 4.times.map{ gets.split.map(&:to_i) }

p arr

hoge = Array.new
# hoge.push(arr)
# hoge.push(arr.transpose)

# p hoge.map{ |h|
p (arr + arr.transpose).map{|x|
  x.inject {|r,i|
    puts "#{r} ,#{i}"
    break false if r == i    
    i
  }
}.include?(false)





# #ver ysk
# A = STDIN.map { |l| l.split.map(&:to_i) }

# puts ((A + A.transpose).any? { |a|
#         a.each_cons(2).any? { |x, y| x == y }
#       }) ? 'CONTINUE' : 'GAMEOVER'
