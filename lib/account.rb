require_relative "./transaction"
require_relative "./statement_printer"

class Account
  
  attr_reader :balance, :transactions

  def initialize(transaction_class: Transaction, printer: StatementPrinter.new)
    @transaction_class = transaction_class
    @printer = printer
    @balance = 0
    @transactions = []
  end

  def deposit(date, credit)
    @balance += credit
    @transactions.push(@transaction_class.new(date: date, credit: credit, balance: @balance))
  end

  def withdraw(date, debit)
    @balance -= debit
    @transactions.push(@transaction_class.new(date: date, debit: debit, balance: @balance))
  end

  def statement
    @printer.print_statement(@transactions)
  end

end