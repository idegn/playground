# -*- coding: utf-8 -*-
#アイウンー

#4*4*4*4=256
s = "アイウン"
"アイウ".each_char do |c|
  256.times do |i| 
    puts c + s[(i/64)%4] + s[(i/16)%4] + s[(i/4)%4] + s[i%4]
  end
  256.times do |i| 
    puts c + "ー" + s[(i/16)%4] + s[(i/4)%4] + s[i%4]
  end
  256.times do |i| 
    puts c + s[(i/64)%4] + "ー" + s[(i/4)%4] + s[i%4]
  end
  256.times do |i| 
    puts c + s[(i/64)%4] + s[(i/16)%4] + "ー" + s[i%4]
  end
  256.times do |i| 
    puts c + s[(i/64)%4] + s[(i/16)%4] + s[(i/4)%4] + "ー"
  end
  256.times do |i| 
    puts c + s[(i/64)%4] + "ー" + s[(i/4)%4] + "ー"
  end
  256.times do |i| 
    puts c + "ー" + s[(i/16)%4] + "ー" + s[i%4] 
  end
end
