# -*- coding: undecided -*-
#paiza
N,K,X = gets.split.map(&:to_i)

graph = {}
K.times do
  k,v = gets.split.map(&:to_i)

  if graph[k]
    graph[k] << v
  else
    graph[k] = [v]
  end
end

s = graph[1]
graph.delete(1)
bl = [X] # | graph[X]
prev = []
while prev != bl
  prev = bl.dup
  graph.each do|key,value| #select使うとうまくやれる可能性?
    if bl.any? {|item| value.include? item}
      bl << key
      graph.delete key
    end
  end
end

puts (s & bl).count
