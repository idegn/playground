#euler 14

def print_steps(steps)
  steps.each_with_index {|x,i| puts "#{i}:#{x}"}
end

def next_collatz(n)
  n.even? ? (n/2) : (3*n + 1)
end

def rec_collatz_test(n,steps)
  return steps[n] if steps[n]
  nxt = next_collatz(n)
  return steps[nxt] ? steps[nxt]+1 : (rec_collatz_test(nxt,steps) + 1)
  
#   if steps[nxt]    #以下メモ版 配列だと100万以上の値もメモ化するため
#     steps[nxt] + 1 #配列のメモリ確保できずに死ぬ。だからハッシュのみ動く
#   else
#     steps[n] = rec_collatz_test(nxt,steps) + 1
#   end
end

def collatz_test(n,steps)
  cnt = 0
  loop do
    return cnt + steps[n] if steps[n]      
    n = next_collatz(n)
    cnt += 1
  end
end


Range = 2...1_000_000
#array 
steps = [0,1]
rsteps = [0,1]

Range.each do |n|
  steps[n] = collatz_test(n,steps)
  rsteps[n] = rec_collatz_test(n,rsteps)
end

p steps[Range] == rsteps[Range]
p steps[0..10]
puts steps.find_index(steps.max)

p rsteps[0..10]
puts rsteps.find_index(rsteps.max)

#p rec_collatz_test(77671,rsteps)

#hash ハッシュ遅い
# steps = {0 => 0, 1 => 1}
# rsteps = {0 => 0, 1 => 1}

# Range.each do |n|
#   steps[n] = collatz_test(n,steps)
#   rec_collatz_test(n,rsteps)
# end

# puts steps.max_by{|_,v| v}.tap{|x|p x}[0]
# puts rsteps.max_by{|_,v| v}.tap{|x|p x}[0]

