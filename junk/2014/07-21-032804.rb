#paiza
L,N,M = gets.split.map(&:to_i)

horizontal_lines = Array.new(N+1){Array.new}

M.times do
  left,left_pos,right_pos = gets.split.map(&:to_i)
  right = left+1
  horizontal_lines[left].push([left_pos,[right,right_pos]])
  horizontal_lines[right].push([right_pos,[left,left_pos]])
end

horizontal_lines =  horizontal_lines.map{
  |arr| arr.sort_by{|x| x[0]}}

cur_pos = L
cur_line = 1
until cur_pos == 0
  pos,nxt = horizontal_lines[cur_line].select{
    |pos,nxt| pos <= cur_pos
  }.max_by{
    |pos,nxt| pos}

  if nxt    
    cur_line,cur_pos = nxt[0],nxt[1]-1
  else
    break
  end
end

puts cur_line
