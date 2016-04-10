# -*- coding: utf-8 -*-
#A* a-star

#グラフ作成用
def calDist(a,b)
  ax,ay = a
  bx,by = b
  Math.sqrt((ax-bx)**2 + (ay-by)**2)
end

def makePoints
  v_num = 5
  xy_limit = 5
  Array(0..xy_limit).repeated_permutation(2).to_a.sample(v_num)
end

def makeGraph(points)
  e_num = 6
  #xlimit,ylimit = 10,10

  v_num = points.size
  g = Array.new(v_num){Array.new}
  Array(0...v_num).combination(2).to_a.sample(e_num).each do |i,j|
    cost = calDist(points[i],points[j]).floor + rand(10)
    g[i].push [j,cost]
    g[j].push [i,cost]
  end
  g
end

def a_star(graph,points)
  start = 0
  goal = points.size-1
  open_list = [[start,calDist(points[start],points[goal])]]
  close_list = []
  

  until open_list.empty?
    n,fn = open_list.min_by{|_n,f| f}#FIXME
    open_list.delete([n,fn])#FIXME

    return fn.to_i if goal == n
    close_list.push n

    graph[n].each do |m,cost|
      gn = fn - calDist(points[n],points[goal])
      fm = gn + calDist(points[m],points[goal]) + cost
      if index = open_list.find_index{|node,value| node == m}
        open_list[index] = [m,fm] if fm < open_list[index][1]
      elsif close_list.include? m
        close_list.delete m
        open_list.push [m,fm] #要検討:下の行との冗長排除
      else
        open_list.push [m,fm]
        #経路の処理はとりまやらない
      end
    end
  end

  nil
end

p points = makePoints
puts
p g = makeGraph(points)
puts
puts a_star(g ,points)

INF = 1_000_000_000
def dijkstra(graph)
  start = 0
  goal = graph.size-1
  dists = Array.new(graph.size){[INF,false]}
  dists[start][0] = 0

  graph.size.times do
    (_dist,_used),pre = dists.each_with_index.select{
      |(_dist,used),i| not used
    }.min_by{|(dist,_used),i| dist}

    dists[pre][1] = true
    
    graph[pre].each_with_index do |(m,cost), index|
      dists[m][0] = dists[pre][0] + cost if dists[pre][0] + cost < dists[m][0]
    end
  end
  dists[goal]
end

p dijkstra(g)[0]

