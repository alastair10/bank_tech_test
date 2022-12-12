class Transaction

  attr_reader  :date, :credit, :debit

  def initialize(date:, credit: nil, debit: nil)
    @date = date
    @credit = credit
    @debit = debit
  end
end