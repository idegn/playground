START = 23

count = 0
(START..100).each do |n|  
  n_fac = (2..n).reduce(&:*)
  r_fac = 1
  n_minus_r_fac = n_fac  
  
  (1..n).each do |r|
    r_fac *= r
    n_minus_r_fac /= (n + 1 - r)
    
    n_comb_r = n_fac / (r_fac * n_minus_r_fac)
    count += 1 if n_comb_r > 1_000_000
  end
end

p count
