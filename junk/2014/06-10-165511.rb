#atcoder arc 22 b
N = gets.to_i
arr = gets.split.map(&:to_i)

ans,j,buf = 0,0,-1


h = Hash.new

N.times do |i|
  if h.include? arr[i]
    ans = [ans,j].max
    buf = [buf,h[arr[i]]].max
    j = i - buf
    h[arr[i]] = i
  else
    h[arr[i]] = i
    j += 1
  end
end

ans = [ans,j].max

puts ans
