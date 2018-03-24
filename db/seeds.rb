# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
  display_name: 'D W A Y N E!',
  email: 'dwayne@gmail.com',
  encrypted_password: '1234'
)

Concept.create!(
  title: 'Tic Tac Toe', 
  description: 'Come on! Everyone knows Tic Tac Toe!',
  resource_links: 'www.dwyn.nyc', 
  user_id: 1
)

Language.create!(
  name: 'Ruby',
  section_id: 1
)

Section.create!(
  title: 'CLI Gem',
  description: 'Utilizing Object Oriented Programming to build and Publish a Ruby Gem.'
)

Concept.create!(
  title: 'Tic Tac Toe', 
  description: 'Come on! Everyone knows Tic Tac Toe!',
  resource_links: 'www.dwyn.nyc', 
  user_id: 1,
)

Concept.create!(
  title: 'Fibonacci Sequence',
  description: 'Enter a number and have the program generate the Fibonacci sequence to that number or to the Nth number',
  resource_links: 'www.dwyn.nyc',
  user_id: 1
)