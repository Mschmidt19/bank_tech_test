require 'account'

describe Account do
  let(:account) { described_class.new }
  let(:time) { Time.now }

  before(:each) do
    allow(Time).to receive(:now).and_return(time)
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
    it 'adds amount passed to balance if no error is raised' do
      account.deposit(100.50)
      expect(account.balance).to be(100.50)
    end
    it 'should push a transaction hash to account.transactions' do
      account.deposit(50)
      expected = [{:time => time.strftime("%d/%m/%Y"), :credit => 50, :debit => nil, :balance => 50}]
      expect(account.transactions).to eq expected
    end
  end
end
