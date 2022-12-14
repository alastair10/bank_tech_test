# class stores details for a single transaction
class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(date: nil, credit: nil, debit: nil, balance: nil)

    param_validator(date, credit, debit)

    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  private

  def param_validator(date, credit, debit)
    raise 'The transaction must have a date.' unless date
    raise 'The transaction must be either a credit or a debit, not both.' if credit && debit
    raise 'The transaction must be a credit or a debit.' unless credit || debit
  end

end
