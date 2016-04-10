5.times do 
  puts "hoge"
  5.times do |i|
    puts "fuga"
    break if i == 2
  end
end
