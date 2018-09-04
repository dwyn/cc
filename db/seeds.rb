# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# unless User.where(email: "admin@example.com").first
#   User.create!(email: 'admin@example.com',
#               password: '123123',
#               password_confirmation: '123123')
#   puts "-- Created admin@example.com with password 123123\n"
# end
#
# Find the first user named "Scarlett" or create a new one with a
# different last name.
# User.find_or_create_by(first_name: 'Scarlett') do |user|
#   user.last_name = 'Johansson'
# end
# # => #<User id: 2, first_name: "Scarlett", last_name: "Johansson">

User.find_or_create_by(email: 'admin@gmail.com') do |user|
  user.last_name = 'Johansson'
end

# u = User.find_or_create_by(
#   display_name: "dwayne.",
#   admin: true,
#   email: "admin@gmail.com", 
#   encrypted_password: "$2a$11$wCPKEDRiT8YIibTfBYB.ReMjtr1FPrOzVSWFp8A0xl/hsFv0vCpA2",
#   reset_password_token: nil, 
#   reset_password_sent_at: nil, 
#   remember_created_at: nil, 
#   sign_in_count: 1, 
#   current_sign_in_at: "2014-12-31 22:27:09", 
#   last_sign_in_at: "2014-12-31 22:27:09", 
#   current_sign_in_ip: "127.0.0.1", 
#   last_sign_in_ip: "127.0.0.1", 
# )
# u.save!(validate: false)

cli = Section.new(
  title: 'CLI Gem',
  description: 'Utilizing Object Oriented Programming to build and Publish a Ruby Gem.',
  #id: 1
)
cli.save!

sinatra = Section.new(
  title: 'Sinatra',
  description: 'Build a fully functioning web app using the Sinatra framework',
  #id: 2
)
sinatra.save!

rails = Section.new(
  title: 'Rails',
  description: 'Build a fully functioning web app using the Rails framework',
  #id: 3
)
rails.save!

rails_jquery = Section.new(
  title: 'Rails App with a jQuery Front End',
  description: 'Style Rails web app using JQuery',
  #id: 4
)
rails_jquery.save!

react = Section.new(
  title: 'React Redux Portfolio Project',
  description: 'Build a beautiful React + Redux project!',
  #id: 5
)
react.save!
binding.pry
Concept.create!(
  title: 'Tic Tac Toe', 
  description: 'Come on! Everyone knows Tic Tac Toe!', 
  user_id: 1,
  favorited: true,
  section_id: 1
)

Concept.create!(
  title: 'Fibonacci Sequence',
  description: 'Enter a number and have the program generate the Fibonacci sequence to that number or to the Nth number',
  user_id: 1,
  favorited: true
  # section_id: 5
  # Id like to seed a concept that belongs to several sections
  # section_id: 1, 2, 3
)

Concept.create!(
  title: 'Next Prime Number',
  description: 'Have the program find prime numbers until the user chooses to stop asking for the next one.',
  user_id: 1,
  favorited: true
  # section_id: 4
)

Concept.create!(
  title: 'Mortgage Calculator',
  description: 'Calculate the monthly payments of a fixed term mortgage over given Nth terms at a given interest rate. Also figure out how long it will take the user to pay back the loan. For added complexity, add an option for users to select the compounding interval (Monthly, Weekly, Daily, Continually).',
  user_id: 1,
  favorited: true
  # section_id: 3
)

Concept.create!(
  title: 'Alarm Clock',
  description: 'A simple clock where it plays a sound after X number of minutes/seconds or at a particular time.',
  user_id: 1,
  favorited: true
  # section_id: 2
)

Concept.create!(
  title: 'Number Names',
  description: "Show how to spell out a number in English. You can use a preexisting implementation or roll your own, but you should support inputs up to at least one million (or the maximum value of your language's default bounded integer type, if that's less). Optional: Support for inputs other than positive integers (like zero, negative integers, and floating-point numbers)",
  user_id: 1,
  favorited: true
  # section_id: 1
)

Concept.create!(
  title: 'Coin Flip Simulation',
  description: 'Write some code that simulates flipping a single coin however many times the user decides. The code should record the outcomes and count the number of tails and heads.',
  user_id: 1,
  favorited: true
  # section_id: 5
)

Concept.create!(
  title: 'Pig Latin',
  description: 'Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed (Ex.: "banana" would yield anana-bay). Read Wikipedia for more information on rules.',
  user_id: 1,
  favorited: true
  # section_id: 4
)

Concept.create!(
  title: 'Count Vowels',
  description: 'Enter a string and the program counts the number of vowels in the text. For added complexity have it report a sum of each vowel found.',
  user_id: 1,
  favorited: false
  # section_id: 1
)

Concept.create!(
  title: 'Check if Palindrome',
  description: 'Checks if the string entered by the user is a palindrome. That is that it reads the same forwards as backwards like “racecar”',
  user_id: 1,
  favorited: true
  # section_id: 3
)

Concept.create!(
  title: 'Guestbook / Journal',
  description: 'A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).',
  user_id: 1,
  favorited: true
  # section_id: 2
)


# Language.create!(
#   name: 'Ruby',
#   section_id: 1
# )

# Language.create!(
#   name: 'Javascript',
#   section_id: 1
# )

# Language.create!(
#   name: 'HTML',
#   section_id: 1
# )

# Language.create!(
#   name: 'CSS',
#   section_id: 1
# )