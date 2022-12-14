require 'account'
require 'transaction'
require 'statement_printer'

describe "acceptance criteria test" do
  it "prints an accurate account statement given 3 transactions" do
    account = Account.new
    account.deposit("10/01/2023",1000)
    account.deposit("13/01/2023",2000)
    account.withdraw("14/01/2023",500)

    expected_output = "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00" + "\n"
    expect{account.statement}.to output(expected_output).to_stdout
  end
end