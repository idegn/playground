def greet_twice(name, first_message, second_message)
  puts "#{first_message}, #{name}"
  puts "#{second_message}, #{name}"
end

greetings = %w(hoge huga)

greet_twice 'ruby' , *greetings
