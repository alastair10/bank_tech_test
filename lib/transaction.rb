class Transaction

  attr_reader  :date, :credit, :debit

  def initialize(date:, credit: nil, debit: nil)

    fail "A transaction must be either a credit or a debit, not both." if credit && debit

    fail "The transaction must be a credit or a debit." if credit == nil && debit == nil

    @date = date
    @credit = credit
    @debit = debit
  end
end