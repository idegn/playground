#euler10
def eratos(n)
  arr = Array.new(n) {|index| index}
  arr[1] = 0
   for i in 2..Math.sqrt(n)
    next if i  == 0
     for j in 2..n
      break if i*j > n
      arr[i*j] = 0
    end
  end
  arr.inject(:+)
end

n = 2_000_000
puts eratos(n)


