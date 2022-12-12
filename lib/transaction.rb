class Transaction

  attr_reader  :date, :credit

  def initialize(date:, credit:)
    @date = date
    @credit = credit
  end
end