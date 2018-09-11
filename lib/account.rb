require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :transactions, :statement

  def initialize
    @balance = 0
    @transactions = []
    @statement = Statement.new
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

  def print_statement
    @statement.print_statement(@transactions)
  end

  private

  def positive_number?(input)
    return false unless input.is_a?(Numeric)
    return false unless input.positive?

    true
  end

end
