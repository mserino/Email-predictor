Email predictor
===============

Tech test written in Ruby
Tested with RSpec

###Overview
The Email Predictor is made by two main classes, *Analyzer* and *Predictor*, by the *User Interface*, the *Constants* and *Error* handler.

The Analyzer handles the creation and matching of the patterns given a set of data (from the Constants).

The Predictor is initialized with a new Analyzer and predicts the possible email (or emails) given the name and the company.

User Interface is used to show the emails of the given data to predict (PEOPLE from Constants) and to predict other kinds of emails, if wanted.

Error to handle the situation in which the given email is not present in the dataset.

###How can you use it?
`$ git clone https://github.com/mserino/Email-predictor.git`

`$ cd Email-predictor`

*Run the app*

`$ ruby app.rb`

*Run the tests*

`$ rspec`