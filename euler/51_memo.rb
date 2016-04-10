REP = 5
MOD = 3
counter = Array.new(MOD){ Array.new(REP, 0) }

(1..REP).each do |i|
  (0..9).each do |j|
    num = (j.to_s * i).to_i
    r = num % MOD
    counter[r][i-1] += 1
  end
end
p counter
