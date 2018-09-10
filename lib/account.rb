require_relative 'deposit'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    deposit = Deposit.new(amount)
    @balance += amount
    deposit.balance = @balance
    @transactions.push(deposit)
  end


end
