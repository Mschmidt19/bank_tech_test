require 'account'

describe Account do

  let(:account) { described_class.new }

  describe "#balance" do
    context "upon initialization" do
      it "should initialize with a balance of 0" do
        expect(account.balance).to be 0
      end
    end
  end

  describe "#transactions" do
    context "upon initialization" do
      it "should initialize as an empty array" do
        expect(account.transactions).to eq []
      end
    end
  end


end
