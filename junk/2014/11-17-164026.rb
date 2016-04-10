#euler 15
def combination_num(n,c)
  # (0...c).map{|i| n-i}.inject(&:*) / (1..c).inject(&:*)
  ((c+1)..n).inject(&:*) / (1..c).inject(&:*)
end

N = 20
p combination_num(N*2,N)
