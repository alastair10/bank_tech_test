require "statement_printer"

describe StatementPrinter do
  it "prints the statement header" do
    statement_printer = StatementPrinter.new
    expected_output = "date || credit || debit || balance\n"
    expect(statement_printer.header).to eq(expected_output)
  end

  it "prints a table of transactions in reverse chronological order" do
    statement_printer = StatementPrinter.new
    allow(transaction_double_1 = instance_double("Transaction")).to receive_messages(date: "10/01/2023", credit: 1000, debit: nil, balance: 1000)
    allow(transaction_double_2 = instance_double("Transaction")).to receive_messages(date: "14/01/2023", credit: nil, debit: 500, balance: 2500)
    allow(transaction_double_3 = instance_double("Transaction")).to receive_messages(date: "13/01/2023", credit: 2000, debit: nil, balance: 3000)
    
    expected_output = "14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
    result = statement_printer.format_rows([transaction_double_1, transaction_double_2, transaction_double_3])
    expect(result).to eq(expected_output)
  end
end