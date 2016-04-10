# vertex
# edge
# used
n = vertex.length

n.times do
  u = -1
  n.times do |i|    
    u = i if !used[i] && (u == -1 || d[i] < d[u])
  end

  break if u == -1 #need?

  edge[u].length do |i|
    d[i] = d[u]+edge[i] if d[i] > d[u]+edge[i]
  end
  
end
