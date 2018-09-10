# frozen_string_literal: true

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise 'Please input a positive number' unless positive_number?(amount)

    @balance += amount
  end

  private

  def positive_number?(input)
    return false unless input.is_a?(Integer) || input.is_a?(Float)
    return false unless input.positive?
    true
  end
end
