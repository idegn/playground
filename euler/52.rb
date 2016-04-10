#愚直

#6倍して桁上りしたらダメなので最上位桁は1
#最上位桁が6種類以上なので6桁以上

# module IntegerExtensions
#   refine Integer do
#     def answer?
#       sorted = self.to_s.chars.sort
#       arr = (2..6).map { |i| self * i }      
#       arr.all? { |x| x.to_s.chars.sort == sorted }
#     end
#   end
# end

# using IntegerExtensions

#ある程度枝刈りしたの書こうとしてたけど愚直of愚直ですぐ見つかってしまったのでやめ
#answer = 0
#(5..Float::INFINITY).each do |i|
  # most_significant_digit = 10 ** i
  # (1..most_significant_digit).each do |j|
  #   num = most_significant_digit + j
# end
#end

class Integer
  def answer?
    sorted = self.to_s.chars.sort
    arr = (2..6).map { |i| self * i }      
    arr.all? { |x| x.to_s.chars.sort == sorted }
  end
end

answer = (100_000..Float::INFINITY).find(&:answer?)
p answer
