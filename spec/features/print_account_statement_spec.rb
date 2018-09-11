require_relative '../../lib/account.rb'

describe "User can print a statement that includes all transactions" do
  let(:time) { Time.now }

  before do
    allow(Time).to receive(:now).and_return(time)
  end

  it "Prints a table to stdout" do
    account = Account.new
    account.deposit(500)
    account.withdraw(100)
    expected_output = expected_output = "#{'Date'.center(12)}||#{'Credit'.center(12)}||#{'Debit'.center(12)}||#{'Balance'.center(12)}\n#{time.strftime("%d/%m/%Y").center(12)}||#{''.center(12)}||#{'100.00'.center(12)}||#{'400.00'.center(12)}\n#{time.strftime("%d/%m/%Y").center(12)}||#{'500.00'.center(12)}||#{''.center(12)}||#{'500.00'.center(12)}\n"
    expect { account.print_statement }.to output(expected_output).to_stdout
  end
end
