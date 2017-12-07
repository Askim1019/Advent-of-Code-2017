#input = [14 0 15 12 11 11 3 5 1 6	8	4	9	1	8	4]

#input = '0 2 7 0' # => try to get it to [2, 4, 1, 2] or 5 as the cycle number


config = gets.split.map(&:to_i)
cycles = 0
history = {}



until history.has_key?(config.to_s)
  # Store cycle count with string representation of memory banks.
  history[config.to_s] = cycles # {"[0, 2, 7, 0]"" => 0, ...}

  index = config.index(config.max) #=> gives 2 because 7 is the highest and is at an index 2
  blocks = config[index] # => blocks equals 7 because config[index] is config[2]

  # Redistribute the blocks from index bank.
  config[index] = 0
  blocks.times do |i|
    config[(index + i + 1) % config.length] += 1
  end

  cycles += 1
end

p history

puts cycles                        # Part 1
puts cycles - history[config.to_s]  # Part 2, cycle count minus when cycle started.


