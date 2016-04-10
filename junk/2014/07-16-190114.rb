#paiza
def invertStones(ci,i,j,dir,board)
  x = i + dir[0]
  y = j + dir[1]
  cnt = 0
  
  while (0 <= x and x < 8) and (0 <= y and y < 8) and board[x][y] == -ci
    x += dir[0]
    y += dir[1]
    cnt += 1
  end
  
  if (0 <= x and x < 8) and (0 <= y and y < 8) and cnt != 0 and board[x][y] != 0
    until (x == i and y == j)
      i += dir[0]
      j += dir[1]    
      board[i][j] *= -1
    end
    board[i][j] *= -1
  end  
end

def putStone(color,i,j,board)
  directions = [[0,-1],[1,-1],[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1]]
  ci = {"B" => 1, "W" => -1}
  
  board[i][j] = ci[color]
  directions.each do |dir|
    invertStones(ci[color], i, j,dir,board)
  end
end

N = gets.to_i

board = Array.new(8){Array.new(8,0)}
board[3][3] = board[4][4] = -1
board[3][4] = board[4][3] = 1

N.times do
  color, i, j = gets.split 
  putStone(color,(i.to_i)-1, (j.to_i)-1,board)
end

xx = board.map{|row| row.select{|x| x == 1}.count }.inject(:+)
yy = board.map{|row| row.select{|x| x == -1}.count }.inject(:+)

if xx != yy
  puts "#{xx}-#{yy} The #{xx > yy ? "black" : "white"} won!"
else
  puts "#{xx}-#{yy} Draw!"
end

