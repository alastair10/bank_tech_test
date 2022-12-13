# class stores details for a single transaction
class Transaction

  attr_reader  :date, :credit, :debit, :balance

  def initialize(date: nil, credit: nil, debit: nil, prior_balance:)

    param_validator(date, credit, debit)

    @date = date
    @credit = credit
    @debit = debit
    @balance = prior_balance + credit.to_i - debit.to_i
  end

  private 

  def param_validator(date, credit, debit)
    fail "The transaction must have a date." unless date
    fail "The transaction must be either a credit or a debit, not both." if credit && debit
    fail "The transaction must be a credit or a debit." unless credit || debit
  end

end