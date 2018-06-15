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
  description: 'Utilizing Object Oriented Programming to build and Publish a Ruby Gem.'
)

Section.create!(
  title: 'Rails',
  description: 'Build a fully functioning web app using the Rails framework'
)

Section.create!(
  title: 'Sinatra',
  description: 'Build a fully functioning web app using the Sinatra framework'
)

Section.create!(
  title: 'Rails App with a jQuery Front End',
  description: 'Style Rails web app using JQuery'
)

Section.create!(
  title: 'React Redux Portfolio Project',
  description: 'Build a beautiful React + Redux project!'
)

Concept.create!(
  title: 'Tic Tac Toe', 
  description: 'Come on! Everyone knows Tic Tac Toe!',
  resource_links: 'www.dwyn.nyc', 
  user_id: 1,
  # Id like to seed a concept that belongs to several sections
  # section_id: 1
)

Concept.create!(
  title: 'Fibonacci Sequence',
  description: 'Enter a number and have the program generate the Fibonacci sequence to that number or to the Nth number',
  resource_links: 'www.dwyn.nyc',
  user_id: 1,
  # Id like to seed a concept that belongs to several sections
  # section_id: 1, 2, 3
)