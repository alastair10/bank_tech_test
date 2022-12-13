require "statement_printer"
describe StatementPrinter do
  it "prints the statement header" do
    statement_printer = StatementPrinter.new
    expected_output = "date || credit || debit || balance\n"
    expect(statement_printer.header).to eq(expected_output)
  end
end