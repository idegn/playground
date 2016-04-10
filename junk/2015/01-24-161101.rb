require 'set'

N,M = gets.split.map(&:to_i)
roads = []
M.times { roads << gets.split.map(&:to_i) } 

groups = Set.new
roads.each do |road|
  a,b = road

  a_in = groups.find { |group| group.include?(a)} 
  b_in = groups.find { |group| group.include?(b)}
  if a_in.nil? && b_in.nil?
    groups << Set.new([a,b])
    #groups << [a,b]
  elsif a_in.nil?
    b_in << a
  elsif b_in.nil?
    a_in << b
  elsif a != b
    a = a + b
    groups.delete(b)
  end
end


#fg = Set.new(groups.flatten)
fg = groups.flatten
lonely_count = (Set.new(1..N) - fg).count

# p groups
# p fg
# p (Set.new(1..N) - fg)
puts (groups.count - 1) + lonely_count
