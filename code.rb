# frozen_string_literal: false

require 'colorize'

# Code generation and crack function
class Code
  attr_reader :value

  def initialize
    @value = generate_random
  end

  def generate_random
    generated = ''
    0.upto(3).each { generated.concat rand(1..6).to_s }
    generated
  end

  def cracked?(guess)
    guess == @value
  end

  def get_hint(guess)
    hint = ''
    guess.split('').each_with_index do |value, position|
      hint += choose_hint(value, position)
    end
    hint
  end

  private

  def choose_hint(guess_char, position)
    if guess_char == @value[position]
      '◉'.encode('UTF-8').red
    elsif @value.split('').any?(guess_char)
      '◉'.encode('UTF-8')
    else
      '◌'.encode('UTF-8')
    end
  end
end
