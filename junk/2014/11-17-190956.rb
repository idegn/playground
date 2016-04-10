#euler 18 兼 euler 67
require "./p067_triangle"
#$triangle
#p $triangle.split("\n").map(&:split).map{|x| x.map(&:to_i)}
tree =  $triangle.split("\n").map{|line| line.split.map(&:to_i)}
#p tree[0][0] 
N =100

def search_value(depth,pos,tree,n,memo)
  my_v = tree[depth][pos]
  return my_v if depth == n

  next_depth = depth+1
  left,right = pos, pos+1  
  lv = memo[next_depth][left] = search_value(next_depth,left,tree,n,memo) if memo[next_depth][left].nil?
  rv = memo[next_depth][right] = search_value(next_depth,right,tree,n,memo) if memo[next_depth][right].nil?
  
  lv = memo[next_depth][left]
  rv = memo[next_depth][right]
  return my_v + (lv > rv ? lv : rv)
end

# N = 4
# tree = [
# [3],
# [7,4],
# [2,4,6],
# [8,5,9,3]]

memo = Array.new(N){[]}
p search_value(0,0,tree,N-1,memo)


