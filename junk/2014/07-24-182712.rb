#bfs function
def bfs(que,field,dists)
  return if que.empty?
  px,py = que.shift

  dirs = [[0,-1],[1,0],[0,1],[-1,0]]
  dirs.each do |dir|
    dx,dy = dir
    nx = px + dx
    ny = py + dy

    if ((0..(N-1)).include? nx and (0..(M-1)).include? ny) and field[nx][ny] != "1" and dists[nx][ny] == INF
      que << [nx,ny]
      dists[nx][ny] = dists[px][py]+1
      return dists[nx][ny] if field[nx][ny] == "g"
    end
  end

  bfs(que,field,dists)
end

M,N = gets.split.map(&:to_i)

INF = 1_000_000_000
dists = Array.new(N){Array.new(M,INF)}

s,g = [],[]
field = Array.new(N) do |i|
  arr = gets.split
  s = [i,arr.find_index("s")]if arr.include? "s"
  g = [i,arr.find_index("g")]if arr.include? "g"
  arr
end

que = [s]
sx,sy = s
dists[sx][sy] = 0

ans = bfs(que,field,dists)
puts ans != INF ? ans : "Fail"

