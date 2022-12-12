class Transaction

  attr_reader  :date, :credit, :debit

  def initialize(date: nil, credit: nil, debit: nil)

    param_validator(date, credit, debit)

    @date = date
    @credit = credit
    @debit = debit
  end

  private 

  def param_validator(date, credit, debit)
    fail "The transaction must have a date." unless date
    fail "The transaction must be either a credit or a debit, not both." if credit && debit
    fail "The transaction must be a credit or a debit." unless credit || debit
  end

end