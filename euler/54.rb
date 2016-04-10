input = "5H 5C 6S 7S KD 2C 3S 8S 8D TD
5D 8C 9S JS AC 2C 5C 7D 8S QH
2D 9C AS AH AC 3D 6D 7D TD QD
4D 6S 9H QH QC 3D 6D 7H QD QS
2H 2D 4C 4D 4S 3C 3D 3S 9S 9D"

HIGH_CARD, ONE_PAIR, TWO_PAIRS, THREE_OF_A_KIND, STRAIGHT,
FLUSH, FULL_HOUSE, FOUR_OF_A_KIND, STRAIGHT_FLUSH, ROYAL_FLUSH = (1..10).to_a

def ranked(hand)
  porker_sort!(hand)
  return ROYAL_FLUSH if flush?(hand) and straight?(hand) and hand[-1].include?("A")
  return STRAIGHT_FLUSH if flush?(hand) and straight?(hand)
  return FOUR_OF_A_KIND if four_of_a_kind?(hand)
  return FULL_HOUSE if three_of_a_kind?(hand) and one_pair?(hand) #TODO: one_pairは厳密に2枚
  return FLUSH if flush?(hand)
  return STRAIGHT if straight?(hand)
  return THREE_OF_A_KIND if three_of_a_kind?(hand)
  return TWO_PAIR if two_pairs?(hand)
  return ONE_PAIR if one_pair?(hand)
  return HIGH_CARD
end


def battle(p1, p2)
  return true if ranked(p1) > ranked(p2)
  
  while( (p1_highest = highest!(p1)) != ( p2_highest = highest!(p2)) ) do end
  p1_highest > p2_highest
end

matches = input.split("\n").map do |line|
  line = line.split(" ")
  [line[0..4], line[5..-1]]
end

p1_win_count = 0
matches.each { |p1, p2| p1_win_count += 1 if battle(p1, p2) }

