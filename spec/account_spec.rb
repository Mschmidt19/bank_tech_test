require 'account'

describe Account do

  let(:account) { described_class.new }

  describe "#balance" do
    context "upon initialization" do
      it "should initialize with a balance of 0" do
        expect(account.balance).to eq 0
      end
    end
  end

end
