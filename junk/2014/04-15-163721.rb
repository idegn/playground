#rabin-karp
text = 'qwerasdfzxcvuipiojkl;m,./'
#pattern = 'jkl;'
#pattern = 'asdf'
#pattern = 'qwer'
pattern = 'm,./'
  
dm, hp,ht,d,q=1, 0,0,128,307
n = text.length
m = pattern.length

(m-1).times do dm = (d*dm)%q end
m.times do |i|
  ht = (ht*d + text[i].ord)%q
  hp = (hp*d + pattern[i].ord )%q
end

puts hp
puts
(n-m+1).times do |i|
  puts ht, text[i..i+m-1]
  if hp == ht
    if text[i..i+m-1] == pattern
      puts i
      exit
    end
  end
  ht = ((ht - text[i].ord*dm)*d + text[i+m].ord)%q
end

puts -1
