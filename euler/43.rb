a = [2, 3, 5, 7, 11, 13, 17].each.with_index(1)

#join使うと実行時間30秒くらい
p Array(0..9).permutation.to_a.select { |arr|
  arr[0] != 0 and arr[3].even? and (arr[5] == 0 or arr[5] == 5)
}.select { |num|
  a.all? { |n, i|
    (num[i]*100 + num[i+1]*10 + num[i+2]) % n == 0
  }
}.map{ |num| num.join.to_i }.reduce(:+)
