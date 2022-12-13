require "account_manager"

describe Account_Manager do

  it "initializes with an account balance of zero" do
    expect(described_class.new.balance).to eq(0)
  end
end