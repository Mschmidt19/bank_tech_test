class Statement

  def print_statement(transaction_array)
    raise "Please input an array" unless transaction_array.is_a? Array

    if transaction_array.empty?
      puts "Your account has no transactions to display"
    else
      puts "#{'Date'.center(12)}||" +
      "#{'Credit'.center(12)}||" +
      "#{'Debit'.center(12)}||" +
      "#{'Balance'.center(12)}"
      transaction_array.reverse_each do |t|
        puts "#{format_time(t.date).center(12)}||" +
        "#{format_float(t.credit).center(12)}||" +
        "#{format_float(t.debit).center(12)}||" +
        "#{format_float(t.balance).center(12)}"
      end
    end
  end

  private
  def format_float(number)
    return "" if number.nil?

    return sprintf('%.2f', number)
  end

  def format_time(time)
    return time.strftime("%d/%m/%Y")
  end

end
