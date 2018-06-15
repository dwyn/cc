# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.new(
  display_name: "D W A Y N E!",
  email: "dwayne@gmail.com", 
  encrypted_password: "$2a$10$5eoHh6M2q4GjGkHClO.NqebWWhS94D8rNj5Ot6CB2qrbn7IrTfkSa", 
  reset_password_token: nil, 
  reset_password_sent_at: nil, 
  remember_created_at: nil, 
  sign_in_count: 1, 
  current_sign_in_at: "2014-12-31 22:27:09", 
  last_sign_in_at: "2014-12-31 22:27:09", 
  current_sign_in_ip: "127.0.0.1", 
  last_sign_in_ip: "127.0.0.1", 
)
u.save!(validate: false)

Language.create!(
  name: 'Ruby',
  section_id: 1
)

Language.create!(
  name: 'Javascript',
  section_id: 1
)

Language.create!(
  name: 'HTML',
  section_id: 1
)

Language.create!(
  name: 'CSS',
  section_id: 1
)


Section.create!(
  title: 'CLI Gem',
  description: 'Utilizing Object Oriented Programming to build and Publish a Ruby Gem.',
  id: 1
)

Section.create!(
  title: 'Rails',
  description: 'Build a fully functioning web app using the Rails framework',
  id: 2
)

Section.create!(
  title: 'Rails App with a jQuery Front End',
  description: 'Style Rails web app using JQuery',
  id: 3
)

Section.create!(
  title: 'React Redux Portfolio Project',
  description: 'Build a beautiful React + Redux project!',
  id: 4
)

Section.create!(
  title: 'Sinatra',
  description: 'Build a fully functioning web app using the Sinatra framework',
  id: 5
)

Concept.create!(
  title: 'Tic Tac Toe', 
  description: 'Come on! Everyone knows Tic Tac Toe!', 
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Fibonacci Sequence',
  description: 'Enter a number and have the program generate the Fibonacci sequence to that number or to the Nth number',
  user_id: 1,
  favorited: true
  # Id like to seed a concept that belongs to several sections
  # section_id: 1, 2, 3
)

Concept.create!(
  title: 'Next Prime Number',
  description: 'Have the program find prime numbers until the user chooses to stop asking for the next one.',
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Mortgage Calculator',
  description: 'Calculate the monthly payments of a fixed term mortgage over given Nth terms at a given interest rate. Also figure out how long it will take the user to pay back the loan. For added complexity, add an option for users to select the compounding interval (Monthly, Weekly, Daily, Continually).',
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Alarm Clock',
  description: 'A simple clock where it plays a sound after X number of minutes/seconds or at a particular time.',
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Number Names',
  description: 'Show how to spell out a number in English. You can use a preexisting implementation or roll your own, but you should support inputs up to at least one million (or the maximum value of your language's default bounded integer type, if that's less). Optional: Support for inputs other than positive integers (like zero, negative integers, and floating-point numbers)',
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Coin Flip Simulation',
  description: 'Write some code that simulates flipping a single coin however many times the user decides. The code should record the outcomes and count the number of tails and heads.',
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Pig Latin',
  description: 'Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed (Ex.: "banana" would yield anana-bay). Read Wikipedia for more information on rules.',
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Count Vowels',
  description: 'Enter a string and the program counts the number of vowels in the text. For added complexity have it report a sum of each vowel found.',
  user_id: 1,
  favorited: false
)

Concept.create!(
  title: 'Check if Palindrome',
  description: 'Checks if the string entered by the user is a palindrome. That is that it reads the same forwards as backwards like “racecar”',
  user_id: 1,
  favorited: true
)

Concept.create!(
  title: 'Guestbook / Journal',
  description: 'A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).',
  user_id: 1,
  favorited: true
)