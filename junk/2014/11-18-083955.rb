#euler 19
require 'date'
now = Date.new(1901,1,1)
count = 0
until now.year == 2001 do
  count += 1 if now.sunday?  
  now = now.next_month
end
puts count
