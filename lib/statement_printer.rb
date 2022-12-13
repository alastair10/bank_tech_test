# class handles printing and formatting of the account statement
class StatementPrinter
  
  def header
    "date || credit || debit || balance\n"
  end

  def format_rows(transactions)
    sorted_transactions = transactions.sort_by(&:date).reverse

    sorted_transactions.map do |transaction|
      "#{transaction.date} || #{transaction_formatter(transaction.credit)}|| #{transaction_formatter(transaction.debit)}|| #{balance_formatter(transaction.balance)}"
    end.join("\n")
  end

  private

  def transaction_formatter(credit_or_debit)
    credit_or_debit ? "#{'%.2f' % credit_or_debit} " : ""
  end

  def balance_formatter(balance)
    "#{'%.2f' % balance}"
  end

end