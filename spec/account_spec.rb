require 'account'

describe Account do
  let(:account) { described_class.new }
  let(:mock_statement_instance) { double :statement_instance }

  before do
    account.instance_variable_set(:@statement, mock_statement_instance)
  end

  describe '#balance' do
    context 'upon initialization' do
      it 'should initialize with a balance of 0' do
        expect(account.balance).to be 0
      end
    end
  end

  describe '#transactions' do
    context 'upon initialization' do
      it 'should initialize as an empty array' do
        expect(account.transactions).to eq []
      end
    end
  end

  describe '#deposit' do
    it 'should accept a deposit amount as an argument' do
      expect(account).to respond_to(:deposit).with(1).argument
    end
    it 'should raise an error if argument is not a positive integer or float' do
      expected_message = 'Please input a positive number'
      expect { account.deposit('a') }.to raise_error(expected_message)
      expect { account.deposit(-50) }.to raise_error(expected_message)
      expect { account.deposit(-50.50) }.to raise_error(expected_message)
    end
    it 'adds the amount passed to balance if no error is raised' do
      account.deposit(100.50)
      expect(account.balance).to be(100.50)
    end
    it 'pushes a new transaction object into @transactions' do
      expect(account.transactions).to receive(:push)
      account.deposit(50)
    end
  end

  describe '#withdraw' do
    it 'should accept a withdrawal amount as an argument' do
      expect(account).to respond_to(:withdraw).with(1).argument
    end
    it 'should raise an error if argument is not a positive integer or float' do
      expected_message = 'Please input a positive number'
      expect { account.withdraw('a') }.to raise_error(expected_message)
      expect { account.withdraw(-20) }.to raise_error(expected_message)
      expect { account.withdraw(-100.50) }.to raise_error(expected_message)
    end
    it 'subtracts the amount passed from balance if no error is raised' do
      account.withdraw(75.25)
      expect(account.balance).to be(-75.25)
    end
    it 'pushes a new transaction object into @transactions' do
      expect(account.transactions).to receive(:push)
      account.withdraw(100)
    end
  end

  describe '#print_statement' do
    it 'delegates printing of transactions to Statement class' do
      expect(account.statement).to receive(:print_statement).with(account.transactions)
      account.print_statement
    end
  end
end
