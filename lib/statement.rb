class Statement

  def print_statement(transaction_array)
    raise "Please input an array" unless transaction_array.is_a? Array

    if transaction_array.empty?
      puts "Your account has no transactions to display"
    else
      width = find_longest_data(transaction_array) + 2
      puts "#{'Date'.center(width)}||" +
      "#{'Credit'.center(width)}||" +
      "#{'Debit'.center(width)}||" +
      "#{'Balance'.center(width)}"
      transaction_array.reverse_each do |t|
        puts "#{format_time(t.date).center(width)}||" +
        "#{format_float(t.credit).center(width)}||" +
        "#{format_float(t.debit).center(width)}||" +
        "#{format_float(t.balance).center(width)}"
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

  def find_longest_data(transaction_array)
    max = 0
    transaction_array.each do |t|
      date = format_time(t.date).length
      credit = format_float(t.credit).length
      debit = format_float(t.debit).length
      balance = format_float(t.balance).length
      largest = [date, credit, debit, balance].max
      max = largest if largest > max
    end
    return max
  end

end
