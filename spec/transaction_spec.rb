require "transaction"

describe Transaction do
  context "when provided with a credit transaction" do
    it "has a date" do
      transaction = Transaction.new(date: "14/01/2023", credit: 500)
      expect(transaction.date).to eq("14/01/2023")
    end
  end
end