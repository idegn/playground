#euler 32
# (1..9).to_a

# (1..4).to_a.permutation(2).each { |i| p i.join.to_i }

require 'set'

o2n = (1..9).to_a

ans = Set.new
#counter = Hash.new(0)
(1..2).each do |i|
  o2n.permutation(i) do |x|
    choices = o2n.reject { |n| x.include?(n) }

    (1..(5-i)).each do |t|
      choices.permutation(t) do |y|
        xx, yy = [x, y].map { |n| n.join.to_i }
        z = xx * yy
        tmp = [xx, yy, z].flat_map { |n| n.to_s.chars.map(&:to_i) }.sort
        ans << z if o2n == tmp
        #counter[[xx, yy].sort.map(&:to_s).join] += 1
      end
    end
  end  
end
#p counter.to_a[0..100]
p ans.reduce(&:+)
