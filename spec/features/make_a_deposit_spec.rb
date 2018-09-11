require_relative '../../lib/account.rb'

describe "User can deposit funds" do
  it "Adds the deposit amount to balance" do
    account = Account.new
    account.deposit(500)
    expect(account.balance).to eq 500
  end
end
