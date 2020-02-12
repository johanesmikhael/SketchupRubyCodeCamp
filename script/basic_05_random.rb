puts "this is 10 random decimal number"
for i in 0..9
  random = rand
  puts(random)
end

puts "this is 10 random integer number from 1..15"
for i in 0..9
  random = rand(1..15)
  puts(random)
end

puts "this is random decimal number from 1.5..2.0"
for i in 0..9
  random = rand(1.5..2.0)
  puts(random)
end
