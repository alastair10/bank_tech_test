require "account"

describe Account do

  it "initializes with an account balance of zero" do
    expect(described_class.new.balance).to eq(0)
  end

  it "initializes with an empty transactions array" do
    expect(described_class.new.transactions).to eq([])
  end

end