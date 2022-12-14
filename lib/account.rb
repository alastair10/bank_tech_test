require_relative './transaction'
require_relative './statement_printer'

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
    log_credit_transaction(date, credit)
  end

  def withdraw(date, debit)
    @balance -= debit
    log_debit_transaction(date, debit)
  end

  def statement
    @printer.print_statement(@transactions)
  end

  private

  def log_credit_transaction(date, credit)
    @transactions.push(@transaction_class.new(date: date, credit: credit, balance: @balance))
  end

  def log_debit_transaction(date, debit)
    @transactions.push(@transaction_class.new(date: date, debit: debit, balance: @balance))
  end

end
