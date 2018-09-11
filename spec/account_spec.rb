require 'account'

describe Account do
  let(:account) { described_class.new }
  let(:mock_statement_instance) { double :statement_instance }

  before do
    account.instance_variable_set(:@statement, mock_statement_instance)
  end

  describe '#balance' do
    it 'Initializes with a balance of 0' do
      expect(account.balance).to be 0
    end
  end

  describe '#transactions' do
    it 'Initializes as an empty array' do
      expect(account.transactions).to eq []
    end
  end

  describe '#deposit' do
    it 'Raises an error if argument is not a positive integer or float' do
      expected_message = 'Please input a positive number'
      expect { account.deposit('a') }.to raise_error(expected_message)
      expect { account.deposit(-50) }.to raise_error(expected_message)
      expect { account.deposit(-50.50) }.to raise_error(expected_message)
    end
    it 'Adds the amount passed to balance if no error is raised' do
      account.deposit(100.50)
      expect(account.balance).to be(100.50)
    end
    it 'Pushes a new transaction object into @transactions' do
      expect(account.transactions).to receive(:push)
      account.deposit(50)
    end
  end

  describe '#withdraw' do
    it 'Raises an error if argument is not a positive integer or float' do
      expected_message = 'Please input a positive number'
      expect { account.withdraw('a') }.to raise_error(expected_message)
      expect { account.withdraw(-20) }.to raise_error(expected_message)
      expect { account.withdraw(-100.50) }.to raise_error(expected_message)
    end
    it 'Subtracts the amount passed from balance if no error is raised' do
      account.withdraw(75.25)
      expect(account.balance).to be(-75.25)
    end
    it 'Pushes a new transaction object into @transactions' do
      expect(account.transactions).to receive(:push)
      account.withdraw(100)
    end
  end

  describe '#print_statement' do
    it 'Delegates printing of transactions to Statement class' do
      expect(account.statement).to receive(:print_statement).with(account.transactions)
      account.print_statement
    end
  end
end
