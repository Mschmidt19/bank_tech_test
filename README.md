# bank_tech_test
#### By Marek Schmidt

## How to run:
* Clone this repository `git clone https://github.com/Mschmidt19/bank_tech_test.git`
* Navigate to the new repository `cd bank_tech_test`
* Install the required gems `bundle install`

### To run tests:
* Run `rspec`

### To check test coverage:
* Test coverage is included in the terminal output when running rspec, however you can also:
* Open the coverage viewer in your browser `open coverage/index.html`

### To check linter:
* Run `rubocop`

### To use the program:
* Open IRB `irb`
* Require the proper file `require './lib/account.rb'`
* If desired, silence IRB return statements to avoid a cluttered terminal `conf.return_format = ""`
* Create a new account `account = Account.new`
* Make some deposits, ensuring you input a positive number `account.deposit(500)`
* Make some withdrawals, again ensuring you input a positive number `account.withdraw(199.99)`
* Print your transactions statement `account.print_statement`
* When finished, exit IRB `exit`

## Context

## Thought process

## Possible areas to improve

## Specification
### Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria
**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
