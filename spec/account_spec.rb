require "account"

describe Account do

let(:transaction_class_double) { class_double("Transaction") }
let(:transaction_double) { instance_double("Transaction") }

  it "initializes with an account balance of zero" do
    expect(described_class.new.balance).to eq(0)
  end

  it "initializes with an empty transactions array" do
    expect(described_class.new.transactions).to eq([])
  end

  context "when making a deposit" do
    it "adds the credit to an array of transaction objects" do
      account = Account.new(transaction_class: transaction_class_double)
      allow(transaction_class_double).to receive(:new)

      account.deposit("13/12/2022", 100)

      expect(transaction_class_double).to have_received(:new).with(date: "13/12/2022", credit: 100, balance: 100)


    end
  end
end