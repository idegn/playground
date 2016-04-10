inp = File.read('p042_words.txt').delete('"').split(',')

#愚直
#$triangle_numbers = [1,3]
#
#def make_triangle_numbers(target)
#  until target < $triangle_numbers[-1]
#    $triangle_numbers << $triangle_numbers[-1] * 2 - $triangle_numbers[-2] + 1
#  end
#end
#
#def triangle_number?(num)
#  make_triangle_numbers(num)
#  $triangle_numbers.include?(num)
#end

#ぐぐって出てきたやつ、速度ほぼ変わらない
def triangle_number?(num)
  x = ((Math.sqrt(1 + 8 * num) - 1) / 2)
  x.to_i == x
end

p inp.select { |str| 
  num = str.chars.map { |c|
    c.ord - 64
  }.reduce(:+)

  triangle_number?(num)
}.count



