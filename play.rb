# frozen_string_literal: false

require './mastermind'

def user_crack_code(master)
  tries = 0
  guess = gets.chomp

  until tries >= 12 || master.code.cracked?(guess)
    puts master.code.get_hint(guess)
    guess = gets.chomp
    tries += 1
  end
  guess
end

def computer_crack_code(master)
  tries = 0
  guess = master.code.generate_random

  until tries >= 12 || master.code.cracked?(guess)
    puts guess
    puts master.code.get_hint(guess)
    tries += 1
    guess = master.crack_code(guess)
  end
  guess
end

puts 'You have 12 tries to crack the code'
puts 'each try gives you a hint of the code'
puts "\n\n* Red means right number, right position"
puts '* White means right number wrong position'
puts '* Hollow circle means wrong number wrong position'
puts "\n\nEnter \"y\" otherwise the computer will try to crack the code"

master = Mastermind.new

if gets.chomp == 'y'
  puts "\n\n"
  guess = user_crack_code(master)
else
  guess = computer_crack_code(master)
end

if master.code.cracked?(guess)
  puts 'You cracked it!'
else
  puts 'Better luck next time!'
end
