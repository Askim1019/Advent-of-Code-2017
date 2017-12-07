#input = [14 0 15 12 11 11 3 5 1 6	8	4	9	1	8	4]

#input = '0 2 7 0' # => try to get it to [2, 4, 1, 2] or 5 as the cycle number

cycles = 0
history = {}
start = gets.split.map(&:to_i)

until history.has_key?(start.to_s)
  history[start.to_s] = cycles # {"[0, 2, 7, 0]"" => 0, ...}

  index = start.index(start.max) #=> gives 2 because 7 is the highest and is at an index 2
  blocks = start[index] # => blocks equals 7 because start[index] is start[2]

  start[index] = 0
  
  blocks.times do |i|
  	start[(index + i + 1) % start.length] += 1
  end

  cycles += 1
end

p history

puts cycles                       
puts cycles - history[start.to_s]  


