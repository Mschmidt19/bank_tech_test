require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise "Please input a positive number" unless positive_number?(amount)

    deposit = Transaction.new(amount)
    @balance += amount
    deposit.balance = @balance
    @transactions.push(deposit)
  end

  def withdraw(amount)
    raise "Please input a positive number" unless positive_number?(amount)

    withdrawal = Transaction.new(-amount)
    @balance -= amount
    withdrawal.balance = @balance
    @transactions.push(withdrawal)
  end

  private

  def positive_number?(input)
    return false unless input.is_a?(Integer) || input.is_a?(Float)
    return false unless input.positive?

    true
  end

end
