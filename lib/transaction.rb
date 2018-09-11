require 'time'

class Transaction

  attr_reader :date, :credit, :debit
  attr_accessor :balance

  def initialize(amount)
    check_valid(amount)
    @date = Time.now
    @credit = amount if amount.positive?
    @debit = -amount if amount.negative?
    @balance = nil
  end

  private

  def number?(input)
    return false unless input.is_a?(Numeric)

    true
  end

  def two_decimals?(input)
    return true if input.is_a?(Integer)
    return false unless input.to_s.split(".")[1].length <= 2

    true
  end

  def check_valid(input)
    raise "Please input a number" unless number?(input)
    raise "Please input only two decimal places" unless two_decimals?(input)
  end

end
