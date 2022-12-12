require "transaction"

describe Transaction do
  context "when provided with a credit transaction" do
    it "has a date property" do
      transaction = Transaction.new(date: "14/01/2023", credit: 500)
      expect(transaction.date).to eq("14/01/2023")
    end

    it "has a credit property" do
      transaction = Transaction.new(date: "14/01/2023", credit: 500)
      expect(transaction.credit).to eq(500)
    end
  end
  
  context "when provided with a debit transaction" do
    it "has a debit property" do
      transaction = Transaction.new(date: "14/01/2023", debit: 900)
      expect(transaction.debit).to eq(900)
    end
  end
end