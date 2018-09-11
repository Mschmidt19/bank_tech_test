require_relative '../../lib/account.rb'

describe "User can withdraw funds" do
  it "Removes the withdrawal amount from balance" do
    account = Account.new
    account.withdraw(100)
    expect(account.balance).to eq -100
  end
end
