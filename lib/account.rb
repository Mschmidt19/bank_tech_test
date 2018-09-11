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
    add_to_balance(amount)
    deposit.balance = self.balance
    self.transactions.push(deposit)
  end

  def withdraw(amount)
    raise "Please input a positive number" unless positive_number?(amount)

    withdrawal = Transaction.new(-amount)
    subtract_from_balance(amount)
    withdrawal.balance = self.balance
    self.transactions.push(withdrawal)
  end

  def print_statement
    self.statement.print_statement(self.transactions)
  end

  private

  def positive_number?(input)
    return false unless input.is_a?(Numeric)
    return false unless input.positive?

    true
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def subtract_from_balance(amount)
    @balance -= amount
  end

end
