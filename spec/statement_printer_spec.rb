require "statement_printer"

describe StatementPrinter do

  it "prints a table of transactions in reverse chronological order" do
    statement_printer = StatementPrinter.new
    allow(transaction_double_1 = instance_double("Transaction")).to receive_messages(date: "10/01/2023", credit: 1000, debit: nil, balance: 1000)
    allow(transaction_double_2 = instance_double("Transaction")).to receive_messages(date: "14/01/2023", credit: nil, debit: 500, balance: 2500)
    allow(transaction_double_3 = instance_double("Transaction")).to receive_messages(date: "13/01/2023", credit: 2000, debit: nil, balance: 3000)
    
    expected_output = "14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
    result = statement_printer.format_rows([transaction_double_1, transaction_double_2, transaction_double_3])
    expect(result).to eq(expected_output)
  end

  describe "print_statement" do
    it "prints a full formatted statement with header when passed transactions" do
      statement_printer = StatementPrinter.new
      allow(transaction_double_1 = instance_double("Transaction")).to receive_messages(date: "01/07/2022", credit: 9000, debit: nil, balance: 9000)
      allow(transaction_double_2 = instance_double("Transaction")).to receive_messages(date: "04/07/2022", credit: nil, debit: 500, balance: 19500)
      allow(transaction_double_3 = instance_double("Transaction")).to receive_messages(date: "03/07/2022", credit: 11000, debit: nil, balance: 20000)
      allow(transaction_double_4 = instance_double("Transaction")).to receive_messages(date: "05/10/2023", credit: nil, debit: 19000, balance: 500)
      
      expected_output = "date || credit || debit || balance\n05/10/2023 || || 19000.00 || 500.00\n04/07/2022 || || 500.00 || 19500.00\n03/07/2022 || 11000.00 || || 20000.00\n01/07/2022 || 9000.00 || || 9000.00" + "\n"

      expect{ statement_printer.print_statement([
        transaction_double_1, 
        transaction_double_2, 
        transaction_double_3, 
        transaction_double_4]) }.to output(expected_output).to_stdout
    end
  end
end