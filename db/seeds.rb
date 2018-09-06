## ----- Create test admin user ----- ##
unless User.where(email: "admin@gmail.com").first
  User.create!(
    id: 1,
    admin: true,
    name: "dwayne",
    display_name: "dwieb",
    email: "admin@gmail.com",
    password: "$2a$11$wCPKEDRiT8YIibTfBYB.ReMjtr1FPrOzVSWFp8A0xl/hsFv0vCpA2",
    encrypted_password: "$2a$11$wCPKEDRiT8YIibTfBYB.ReMjtr1FPrOzVSWFp8A0xl/hsFv0vCpA2"
    )
end

## ----- Generate static Learn.co Sections ----- ##
unless Section.where(title: "CLI Gem").first
  Section.create!(
    title: 'CLI Gem',
    description: 'Utilizing Object Oriented Programming to build and Publish a Ruby Gem.',
    id: 1
  )
end

unless Section.where(title: "Sinatra").first
  Section.create!(
    title: "Sinatra",
    description: 'Build a fully functioning web app using the Sinatra framework',
    id: 2
  )
end

unless Section.where(title: "Rails").first
  Section.create!(
    title: "Rails",
    description: 'Build a fully functioning web app using the Rails framework',
    id: 3
  )
end

unless Section.where(title: "Rails + JQuery").first
  Section.create!(
    title: "Rails & JQuery",
    description: 'Style Rails app using JQuery',
    id: 4
  )
end

unless Section.where(title: "React Redux Portfolio Project").first
  Section.create!(
    title: "React Redux Portfolio Projec",
    description: 'Build a beautiful React + Redux project!',
    id: 5
  )
end

## ----- Generate sample concepts ----- ##
Concept.create!(
  title: 'Tic Tac Toe', 
  description: 'Come on! Everyone knows Tic Tac Toe!', 
  favorited: true,
  user_id: 1,
  section_id: 1
)

Concept.create!(
  title: 'Fibonacci Sequence',
  description: 'Enter a number and have the program generate the Fibonacci sequence to that number or to the Nth number',
  user_id: 1,
  favorited: true,
  section_id: 5
)

Concept.create!(
  title: 'Next Prime Number',
  description: 'Have the program find prime numbers until the user chooses to stop asking for the next one.',
  user_id: 1,
  favorited: true,
  section_id: 4
)

Concept.create!(
  title: 'Mortgage Calculator',
  description: 'Calculate the monthly payments of a fixed term mortgage over given Nth terms at a given interest rate. Also figure out how long it will take the user to pay back the loan. For added complexity, add an option for users to select the compounding interval (Monthly, Weekly, Daily, Continually).',
  user_id: 1,
  favorited: true,
  section_id: 3
)

Concept.create!(
  title: 'Alarm Clock',
  description: 'A simple clock where it plays a sound after X number of minutes/seconds or at a particular time.',
  favorited: true,
  user_id: 1,
  section_id: 2,
)

Concept.create!(
  title: 'Number Names',
  description: "Show how to spell out a number in English. You can use a preexisting implementation or roll your own, but you should support inputs up to at least one million (or the maximum value of your language's default bounded integer type, if that's less). Optional: Support for inputs other than positive integers (like zero, negative integers, and floating-point numbers)",
  user_id: 1,
  favorited: true,
  section_id: 1
)

Concept.create!(
  title: 'Coin Flip Simulation',
  description: 'Write some code that simulates flipping a single coin however many times the user decides. The code should record the outcomes and count the number of tails and heads.',
  user_id: 1,
  favorited: true,
  section_id: 5
)

Concept.create!(
  title: 'Pig Latin',
  description: 'Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed (Ex.: "banana" would yield anana-bay). Read Wikipedia for more information on rules.',
  user_id: 1,
  favorited: true,
  section_id: 4
)

Concept.create!(
  title: 'Count Vowels',
  description: 'Enter a string and the program counts the number of vowels in the text. For added complexity have it report a sum of each vowel found.',
  user_id: 1,
  favorited: false,
  section_id: 1
)

Concept.create!(
  title: 'Check if Palindrome',
  description: 'Checks if the string entered by the user is a palindrome. That is that it reads the same forwards as backwards like “racecar”',
  user_id: 1,
  favorited: true,
  section_id: 3
)

Concept.create!(
  title: 'Guestbook / Journal',
  description: 'A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).',
  user_id: 1,
  favorited: true,
  section_id: 2
)