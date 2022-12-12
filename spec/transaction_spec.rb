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

  context "when given a credit and debit transaction" do
    it "raises an error" do
      expect{Transaction.new(date: "14/01/2023", credit: 400, debit: 100)}.to raise_error "A transaction must be either a credit or a debit, not both."
    end
  end

  context "when not given a credit or debit transaction" do
    it "raises an error" do
      expect{Transaction.new(date: "14/01/2023")}.to raise_error "The transaction must be a credit or a debit."
    end
  end

  context "when the transaction is missing a date" do
    it "raises an error" do
      expect{transaction = Transaction.new(credit: 850)}.to raise_error ("The transaction must have a date.")
    end
  end
end