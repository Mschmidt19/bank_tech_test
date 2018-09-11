# bank_tech_test
#### By Marek Schmidt

## How to run:
* Clone this repository `git clone https://github.com/Mschmidt19/bank_tech_test.git`
* Navigate to the new repository `cd bank_tech_test`
* Install the required gems `bundle install`

### To run tests:
* Run `rspec`
* Feature tests are in the './spec/features' directory, one for each user story

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
This project is a mock "tech test" simulating a tech test that one might get when applying for a developer job. The time frame for this test was two days, though I completed it in just over one day. The problem is quite simple, though the goal of this project is to right very clean, well tested code that follows all best practices.

## Thought process
Initially, I began with two classes in mind, one 'account' class, responsible for the majority of the program, and one 'displayer' class, responsible for printing your account statement. I realized that there is a possibility for both third class, a 'transaction' class, which can be used in place of a hash to store information on each transaction. I nearly added two separate classes, one for withdrawals and one for deposits, but I realized this would not make my code very DRY as they would be nearly identical.
Overall, I wanted this program to function properly so I kept edge cases in mind. I began checking for incorrect inputs that could cause problems almost immediately, but it wasn't until much later that I added a final check for too many decimal places (which could cause discrepancies between bank balance and printed statements if gone unchecked).  

## Possible areas to improve
The biggest area that may need to be changed is the formatting of terminal outputs. I decided from the start to format the account statement to increase readability, though it may have been the wrong decision as It was not explicitly asked for. I did ensure that the column widths can expand to hold very large data, though I still don't know if it was the correct choice.
Unfortunately, formatting the terminal output does cause three offenses on rubocop.
Secondly, there are still places that my code repeats itself. Specifically the specs for deposit and withdrawal on account are extremely similar. I'm not exactly sure how to clear this up, as they are inherently very similar.
Finally, it was difficult to test for all possible inputs. For instance, if a user inputs 'deposit(100,000)' it will give an error stating wrong number of arguments. I was unable to catch these errors and instead return a more helpful message.

## User stories
```
As member of a bank
So that I can store my money
I would like to be able to deposit funds
```
```
As member of a bank
So that I can have money to spend
I would like to be able to withdraw funds
```
```
As member of a bank
So that I can keep track of my transactions
I would like to be able to print a statement of all my transactions
```

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
