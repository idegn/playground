require 'stackprof'
require 'prime'

StackProf.run(out: "/tmp/profile.dump") do
  def family_size(j, pattern)
    count = 1
    (j+1..9).each do |i|
      tmp = pattern.map {|d| d == true ? i : d }.join.to_i
      count += 1 if Prime.prime? tmp
    end
    count
  end

  def fill_pattern(pattern, repeate, norepeate)
    tmp = norepeate.to_s.chars.map(&:to_i)
    pattern.map { |d| d ? repeate : tmp.shift }
  end

  five_patterns = ([true]*3 + [false]).permutation.to_a.uniq.map {|p| p << false }
  six_patterns = ([true]*3 + [false]*2).permutation.to_a.uniq.map {|p| p << false }

  result = 1_000_000

  (11..999).step(2) do |i|
    next if i % 5 == 0
    
    patterns = i < 100 ? five_patterns : six_patterns

    patterns.each do |pa|
      (0..2).each do |j|
        next if pa[0] == true and j == 0

        candidate = fill_pattern(pa, j, i).join.to_i
        
        if candidate < result and Prime.prime? candidate
          pattern = fill_pattern(pa, true, i)
          if family_size(j, pattern) == 8
            result = candidate
          end
          break
        end
      end
    end  
  end

  p result

  # p fill_pattern([true,true,true,false,false], nil, 12)
  # p family_size(1, fill_pattern([true,false], true, 3))
  # p family_size(0, fill_pattern([false,false,true,true,false], true, 563))
end
