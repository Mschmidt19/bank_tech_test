require 'time'

class Deposit

  attr_reader :date, :credit, :debit
  attr_accessor :balance

  def initialize(amount)
    raise "Please input a positive number" unless positive_number?(amount)
    @date = format_time(Time.now)
    @credit = amount
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
