require 'transaction'

describe Transaction do
  let(:deposit) { Transaction.new(50) }
  let(:withdrawal) { Transaction.new(-25) }
  let(:time) { Time.now }

  before(:each) do
    allow(Time).to receive(:now).and_return(time)
  end

  describe "Upon initialization" do
    it "Raises an error if argument is not an integer or float" do
      expected_message = "Please input a number"
      expect { Transaction.new("a") }.to raise_error(expected_message)
      expect { Transaction.new([]) }.to raise_error(expected_message)
    end
    it "Sets @date to a formatted version of Time.now" do
      expect(deposit.date).to eq(time.strftime("%d/%m/%Y"))
    end

    context "Making a deposit" do
      it "Sets @credit to the amount passed" do
        expect(deposit.credit).to eq 50
      end
      it "Leaves @debit as nil" do
        expect(deposit.debit).to be nil
      end
    end

    context "Making a withdrawal" do
      it "Leaves @credit as nil" do
        expect(withdrawal.credit).to be nil
      end
      it "Sets @debit to the absolute value of the amount passed" do
        expect(withdrawal.debit).to eq 25
      end
    end

  end

end
