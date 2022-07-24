# frozen_string_literal: false

require './code'

# Implementation of the mastermind game
class Mastermind
  attr_reader :code

  def initialize
    @code = Code.new
  end

  def crack_code(guess)
    generated = guess.split('')
    hint = aditional_hint(guess)

    generated.each_index do |index|
      if hint[index]
        generated[index]
      else
        generated[index] = rand(1..6).to_s
      end
    end
    generated.join
  end

  private

  def aditional_hint(guess)
    hint = []
    guess.split('').each_with_index do |value, position|
      hint.push(value == @code.value[position])
    end
    hint
  end
end
