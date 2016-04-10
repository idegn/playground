#euler 24
#puts (0..9).to_a.permutation.to_a.sort[1_000_000 - 1].join

#どうせなので順列作ってみた。flat_mapのところmapにしてたせいで、入れ子になってることに気づくのにすごい時間かかった
nums = (0..9).to_a

def perm(arr)
  return [arr] if arr.count == 1

  return arr.flat_map { |n|
    next_arr = arr.reject { |i| i == n }

    perm(next_arr).map { |pt| [n] + pt }
  }
end

#p perm(nums).sort == (0..9).to_a.permutation.to_a.sort

