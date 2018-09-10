require 'account'

describe Account do
  let(:account) { described_class.new }
  # let(:mock_deposit) { double :deposit_instance }
  #
  # before do
  #   mock_deposit.instance_variable_set(:@date, "10/09/2018")
  #   mock_deposit.instance_variable_set(:@credit, 50)
  #   mock_deposit.instance_variable_set(:@balance, 50)
  # end

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
    it 'adds amount passed to balance if no error is raised' do
      account.deposit(100.50)
      expect(account.balance).to be(100.50)
    end
    it 'pushes a new deposit object into @transactions' do
      expect(account.transactions).to receive(:push)
      account.deposit(50)
    end
  end
end
