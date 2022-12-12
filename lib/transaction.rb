class Transaction

  attr_reader  :date, :credit, :debit

  def initialize(date:, credit: nil, debit: nil)

    if credit && debit 
      fail "A transaction must be either a credit or a debit, not both."
    end

    @date = date
    @credit = credit
    @debit = debit
  end
end