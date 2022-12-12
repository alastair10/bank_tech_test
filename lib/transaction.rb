class Transaction

  attr_reader  :date, :credit, :debit

  def initialize(date: nil, credit: nil, debit: nil)

    fail "The transaction must have a date." unless date

    fail "A transaction must be either a credit or a debit, not both." if credit && debit

    fail "The transaction must be a credit or a debit." unless credit || debit

    @date = date
    @credit = credit
    @debit = debit
  end
end