class Account_Manager
  
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end
end