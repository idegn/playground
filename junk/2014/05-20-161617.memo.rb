# -*- coding: utf-8 -*-
hchars = %w{あ い う}
tchars = %w{あ い う ん ー}

puts 4.times.inject(hchars) {
  |s, e| s.product(tchars)
}.map(&:flatten).reject {
  |e| e[0..-2].zip(e[1..-1]).inject(false) {
    |s, (e1, e2)| s || (e1 == e2 && e1 == "ー")
  }
}.map { |e| e.join('') }

###
words = %w(あ い う ん ー)
reject_word = %w(ん ー)
p words.repeated_permutation(5).collect(&:join).reject{
  |a| reject_word.include?(a[0]) or a.include?("ーー")}



hogealkdsjf;lj
ljsadfl
lkjsdf


hogealskdjfalskjdf
