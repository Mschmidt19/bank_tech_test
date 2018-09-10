require 'time'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise 'Please input a positive number' unless positive_number?(amount)

    @balance += amount
    transaction =
    {
      :time => format_time(Time.now),
      :credit => amount,
      :debit => nil,
      :balance => @balance
    }
    @transactions.push(transaction)
  end

  private

  def positive_number?(input)
    return false unless input.is_a?(Integer) || input.is_a?(Float)
    return false unless input.positive?

    true
  end

  def format_time(time)
    return time.strftime("%d/%m/%Y")
  end
end
