require 'statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:mock_transaction1) { double :transaction }
  let(:mock_transaction2) { double :transaction }
  let(:mock_transaction3) { double :transaction }
  let(:time) { Time.now }

  before do
    allow(Time).to receive(:now).and_return(time)

    allow(mock_transaction1).to receive(:date).and_return(time)
    allow(mock_transaction1).to receive(:credit).and_return(100)
    allow(mock_transaction1).to receive(:debit).and_return(nil)
    allow(mock_transaction1).to receive(:balance).and_return(100)

    allow(mock_transaction2).to receive(:date).and_return(time)
    allow(mock_transaction2).to receive(:credit).and_return(nil)
    allow(mock_transaction2).to receive(:debit).and_return(49.99)
    allow(mock_transaction2).to receive(:balance).and_return(50.01)

    allow(mock_transaction3).to receive(:date).and_return(time)
    allow(mock_transaction3).to receive(:credit).and_return(100_000_000_000)
    allow(mock_transaction3).to receive(:debit).and_return(nil)
    allow(mock_transaction3).to receive(:balance).and_return(100_000_000_000)

  end

  describe "#print_statement" do
    it "Raises an error if argument passed is not an array" do
      expected_message = "Please input an array"
      expect { statement.print_statement("a") }.to raise_error(expected_message)
    end

    context "No transactions have been made" do
      it "States that there is nothing to display" do
        expected_message = "Your account has no transactions to display\n"
        expect { statement.print_statement([]) }.to output(expected_message).to_stdout
      end
    end

    context "Array of transactions passed" do
      it "Prints a formatted table of previous transactions" do
        expected_output = "#{'Date'.center(12)}||#{'Credit'.center(12)}||#{'Debit'.center(12)}||#{'Balance'.center(12)}\n#{time.strftime("%d/%m/%Y").center(12)}||#{''.center(12)}||#{'49.99'.center(12)}||#{'50.01'.center(12)}\n#{time.strftime("%d/%m/%Y").center(12)}||#{'100.00'.center(12)}||#{''.center(12)}||#{'100.00'.center(12)}\n"
        mock_transactions = [mock_transaction1, mock_transaction2]
        expect { statement.print_statement(mock_transactions) }.to output(expected_output).to_stdout
      end
      it "Adjusts table column widths to the largest bit of data" do
        expected_output = "#{'Date'.center(17)}||#{'Credit'.center(17)}||#{'Debit'.center(17)}||#{'Balance'.center(17)}\n#{time.strftime("%d/%m/%Y").center(17)}||#{'100000000000.00'.center(17)}||#{''.center(17)}||#{'100000000000.00'.center(17)}\n"
        mock_transactions = [mock_transaction3]
        expect { statement.print_statement(mock_transactions) }.to output(expected_output).to_stdout
      end
    end
  end

end
