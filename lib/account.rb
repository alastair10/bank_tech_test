require "transaction"

class Account
  
  attr_reader :balance, :transactions

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @balance = 0
    @transactions = []
  end

  def deposit(date, credit)
    @balance += credit
    @transactions.push(@transaction_class.new(date: date, credit: credit, balance: @balance))
  end
end