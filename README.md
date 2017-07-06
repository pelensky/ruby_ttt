[![Build Status](https://travis-ci.org/pelensky/ruby_ttt.svg?branch=master)](https://travis-ci.org/pelensky/ruby_ttt)
[![Coverage Status](https://coveralls.io/repos/github/pelensky/ruby_ttt/badge.svg?branch=place_marker)](https://coveralls.io/github/pelensky/ruby_ttt?branch=master)

## Ruby Tic Tac Toe 

This is a simple Tic Tac Toe game built in Ruby. It can be played in the command
line or on the web.

There are three types of players, and a game can be played by any combination of them:
1. Human
2. Simple Computer
3. Expert Computer

#### CLI Running instructions
1. Clone the repository by clicking on the green "Clone or Download" button
2. Navigate to the directory in the command line
3. Install bundles by running `bundle`
4. Run the app by running `ruby play.rb`


#### Web Running instructions
1. Clone the repository by clicking on the green "Clone or Download" button
2. Navigate to the directory in the command line
3. Install bundles by running `bundle`
4. Run the app by typing `shotgun`
5. In a browser of your choice, navigate to [localhost:9393](localhost:9393)

#### The Rules

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

#### References

This implementation uses the Negamax algorithm with Alpha Beta pruning. I found
[this article](http://www.hamedahmadi.com/gametree/#negamax) to be extremely
helpful. 
