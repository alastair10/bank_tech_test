require "transaction"

describe Transaction do

  context "when provided with a credit transaction" do
    let(:transaction) {Transaction.new(date: "14/01/2023", credit: 500, prior_balance: 100)}

    it "has a date property" do
      expect(transaction.date).to eq("14/01/2023")
    end

    it "has a credit property" do
      expect(transaction.credit).to eq(500)
    end

    it "has a balance property that is prior_balance plus credit amount" do
      expect(transaction.balance).to eq(600)
    end
  end

  context "when provided with a debit transaction" do
    let(:transaction) {Transaction.new(date: "14/01/2023", debit: 900, prior_balance: 1000)}
  
    it "has a debit property" do
      expect(transaction.debit).to eq(900)
    end
  end

  context "when given a credit and debit transaction" do
    it "raises an error" do
      expect{Transaction.new(date: "14/01/2023", credit: 400, debit: 100, prior_balance: 500)}.to raise_error "The transaction must be either a credit or a debit, not both."
    end
  end

  context "when not given a credit or debit transaction" do
    it "raises an error" do
      expect{Transaction.new(date: "14/01/2023", prior_balance: 0)}.to raise_error "The transaction must be a credit or a debit."
    end
  end

  context "when the transaction is missing a date" do
    it "raises an error" do
      expect{transaction = Transaction.new(credit: 850, prior_balance: 0)}.to raise_error ("The transaction must have a date.")
    end
  end
end