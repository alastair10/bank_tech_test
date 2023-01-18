# Bank Tech Test


### UPDATE: Reviewer Feedback

The following is the reviewer's feedback on my tech test submission:

_There is a lot of good work here, Alastair. Your documentation includes a good introduction to design, including a fair attempt at use of sequence diagram. It may be worth checking some details of the layout of this, e.g. do we need to have a separate "individual transaction" on the diagram?  Your installation and running instructions work exactly as your documentation mentions they should. You have a good, clean, clear, commit history showing a TDD process. You have good use of doubles for unit testing and some integration testing. Your code sensibly allows key fields of the account class to only be read, but not written to without your own access methods. As a point to consider, I notice that you validate input types for transactions, but not the values themselves. Due to the very high quality of work throughout, I am awarding you a pass at professional level, however, in future do carefully also consider validation of the values of inputs, not just their types. A less lenient employer may fail your submission if this is not included._

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```
## App design
The App is split into 3 classes: 
- `Transaction`: defines the details for a single transaction. This includes date, credit/debit amounts, and a running account balance. 
- `Account`: creates a new instance of `Transaction` for each `#deposit` and `#withdrawal` made. `#statement` creates a new instance of `StatementPrinter` to generate the account statement at any given time.
- `StatementPrinter`: handles the printing and formatting of the account statement. The `#print_statement` method loops through each individual transaction stored on `Account` and outputs to the terminal. 

### Sequence diagram
![sequence_diagram](resources/sequence_diagram_bank_tech_test.png)

## Running the app

### Installation
Clone this repo:
```
$ git clone https://github.com/alastair10/bank_tech_test.git
```
Navigate to project file and install dependencies:
```
$ cd bank_tech_test
$ bundle install
```

### Usage
The user interacts with the app by providing the date and amounts of each transaction. 

To run the app in IRB via the terminal:
```
$ irb -r ./lib/account.rb
```
Create a new account:
```
$ account = Account.new
```
Making deposits and withdrawals:
```
$ account.deposit("10/01/2023", 1000)
$ account.deposit("13/01/2023", 2000)
$ account.withdraw("14/01/2023", 500)
```
Printing an account statement:
```
account.statement
```

### Testing
In the parent directory, run RSpec:
```
$ cd bank_tech_test
$ rspec
```

### App screenshot preview
![App Preview](resources/terminal_example.png)

### Technologies
- Ruby
- RSpec
