require 'time'

class Transaction

  attr_reader :date, :credit, :debit
  attr_accessor :balance

  def initialize(amount)
    raise "Please input a number" unless number?(amount)

    @date = format_time(Time.now)
    @credit = amount if amount.positive?
    @debit = -amount if amount.negative?
  end

  private

  def number?(input)
    return false unless input.is_a?(Integer) || input.is_a?(Float)

    true
  end

  def format_time(time)
    return time.strftime("%d/%m/%Y")
  end

end
