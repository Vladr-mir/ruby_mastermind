# frozen_string_literal: false

require './mastermind'

master = Mastermind.new
puts "Valor #{master.code.value}"
tries = 0
guess = master.code.generate_random

until tries >= 12 || master.code.cracked?(guess)
  puts master.code.get_hint(guess)
  tries += 1
  guess = master.crack_code(guess)
end

if master.code.cracked?(guess)
  puts 'You cracked it!'
else
  puts 'Better luck next time!'
end
