require 'deposit'

describe Deposit do
  let(:deposit) { Deposit.new(50) }
  let(:time) { Time.now }

  before(:each) do
    allow(Time).to receive(:now).and_return(time)
  end

  context "Upon initialization" do
    it "Raises an error if argument is not a positive integer or float" do
      expected_message = "Please input a positive number"
      expect { Deposit.new("a") }.to raise_error(expected_message)
      expect { Deposit.new(-50) }.to raise_error(expected_message)
      expect { Deposit.new(-50.50) }.to raise_error(expected_message)
    end
    it "sets @date to a formatted version of Time.now" do
      expect(deposit.date).to eq(time.strftime("%d/%m/%Y"))
    end
    it "sets @credit to the amount passed" do
      expect(deposit.credit).to eq 50
    end
  end

end
