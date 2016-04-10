N = gets.to_i
arr = N.times.map { gets.to_i }

count = 0
past = Array.new
past.push Marshal.load(Marshal.dump(arr))

while true do
  past.push(Marshal.load(Marshal.dump(past[count])))
  
  N.times do |i|
    past[count+1][i] = (past[count+1][i]+1)%2 if past[count][i-1] == past[count][(i+1)%N] && past[count][i-1] == past[count+1][i]
  end
  
  if count != 0 && past[count-1] == past[count+1]
    puts "-1"
    break
  end
  if past[count] == past[count+1]
    puts count+1
    break
  end
  count += 1
end
