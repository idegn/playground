#knuth-morris-pratt KMS
# text = 'qwerasdfzxcvuipiojkl;m,./'
#pattern = 'jkl;'
#pattern = 'asdf'
#pattern = 'qwer'
#pattern = 'm,./'

text = 'aaaababa'
# pattern = 'aaaab'
pattern = 'aabab'

n = text.length
m = pattern.length

j = -1
nxt = Array.new
m.times do |i|  
  nxt[i] = j
  j = nxt[j] while (j>=0)&&(pattern[j]!=pattern[i])
  j += 1
end

p nxt

j = 0
n.times do |i|
  j = nxt[j] while (j>=0)&&(text[i]!=pattern[j])
  if j == pattern.length-1
    puts i-m+1
    exit
  end
  j += 1
end
puts -1
