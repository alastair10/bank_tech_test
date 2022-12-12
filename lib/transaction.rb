class Transaction

  attr_reader  :date, :credit, :debit

  def initialize(date:, credit: nil, debit: nil)

    fail "A transaction must be either a credit or a debit, not both." if credit && debit

    fail "The transaction must be a credit or a debit." unless credit || debit

    @date = date
    @credit = credit
    @debit = debit
  end
end