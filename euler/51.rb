require 'stackprof'
require 'prime'
require 'set'
StackProf.run(out: "/tmp/profile.dump") do

# def rec(idx, digits, h)
#   idx.each_with_index do |e, i|
#     if e == "*"
#       idx[i] = digits[i]
#       h[idx] += [digits]
#       if idx.select { |c| c == "*" }.count > 2
#         rec(idx, digits, h)
#       end
#       idx[i] = "*"
#     end
#   end
# end

def rec(idx, digits, h, d) #ほぼほぼ変わらない
  idx[d..-1].each_with_index do |e, i|
    if e == "*"
      i += d
      idx[i] = digits[i]
      h[idx] += [digits]
      if idx.select { |c| c == "*" }.count > 2
        rec(idx, digits, h, d+1)
      end
      idx[i] = "*"
    end
  end
end

N = 1_000_000

primes =  Prime.each(N).to_a
h = Hash.new { Set.new }

primes.each do |n|
  digits = n.to_s.chars
  if digits.count != digits.uniq.count    
    tmp = digits.uniq
    diff = digits.reject { |d| tmp.delete(d) if tmp.include?(d) }.uniq

    diff.each do |d|
      idx = digits.map { |x| x == d ? "*" : x }
      
      h[idx] += [digits]
      rec(idx, digits, h, 0) if idx.select { |c| c == "*" }.count > 2
      #rec(idx, digits, h) if idx.select { |c| c == "*" }.count > 2
    end
  end
end

h.each { |key, value| p [key, value] if value.count == 8 }
end
