# 愚直、激遅だったけど、findからbsearchに変えたらまぁまぁ早い
ans = Array.new(1001, 0)
elems = (0..1000).map { |i| i ** 2 }.each_with_index.to_a[1..-1]
elems.repeated_combination(2).each do |((x,xi), (y,yi))|
  # z, zi = elems.find { |(z, zi)| z == x + y }
  z, zi = elems.bsearch { |(z, zi)| z >= x + y }
  next if z != x + y
  # if !z.nil? and (sum = xi + yi + zi) <= 1000
  if (sum = xi + yi + zi) <= 1000
    ans[sum] += 1
  end
end 
p ans.each_with_index.max_by { |(x, xi)| x }
