class Transaction

  attr_reader  :date
  
  def initialize(date:, credit:)
    @date = date
  end
end