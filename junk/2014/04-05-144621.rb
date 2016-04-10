#algorithm p13 3
# inp = [1, 2, 3, 4, 5, 6, 7]
# inp = inp.reverse
inp = [7, -6, 2, -8, 3, 8]

maxk,mink,sum = 0,0,0
min = max = inp[0]

i = 0
while i < inp.length-1
  sum += inp[i]
  if sum > max
    max = sum
    maxk = i
  elsif sum < min
    min = sum
    mink = i
  end
  i+=1
end

sum += inp[-1]

p sum
p max
p min

diff1 = max - (sum-max)
p diff1
diff2 = (sum-min) - min
p diff2
k = diff1 > diff2 ? maxk : mink
p k
p diff1 > diff2 ? diff1 : diff2

