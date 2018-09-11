require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :transactions, :transaction_class, :statement

  def initialize(statement = Statement.new, transaction_class = Transaction)
    @balance = 0
    @transactions = []
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    raise "Please input a positive number" unless positive_number?(amount)

    update_account(amount)
  end

  def withdraw(amount)
    raise "Please input a positive number" unless positive_number?(amount)

    update_account(-amount)
  end

  def print_statement
    statement.print_statement(transactions)
  end

  private

  def positive_number?(input)
    return false unless input.is_a?(Numeric)
    return false unless input.positive?

    true
  end

  def change_balance(amount)
    @balance += amount
  end

  def update_account(amount)
    new_transaction = transaction_class.new(amount)
    change_balance(amount)
    new_transaction.balance = balance
    transactions.push(new_transaction)
  end

end
