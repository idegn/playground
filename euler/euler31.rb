coins = [200, 100, 50, 20, 10, 5, 2, 1]

def rec(money, coins)
  return 1 if money.zero?

  c = coins.first
  rest = coins[1..-1]

  (rest.empty? ? 0 : rec(money, rest)) +
  (c <= money ? rec(money - c, coins) : 0)
end

p coins.map { |c| rec(c, coins) }
