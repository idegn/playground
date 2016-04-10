File.open("./names.txt") do |file|
  names = file.read.delete('"').split(',')
  
  names = names.sort
  GETA = 'A'.codepoints[0] - 1

  p names.each_with_index.inject(0) { |score, (name, index)|
    score += name.codepoints.inject(0) { |sum, point| sum += (point - GETA) } * (index + 1)
  } 
end
