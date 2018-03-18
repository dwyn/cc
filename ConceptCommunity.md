#Notes for Concept Community
## i.e. Notes for future me. 

It's a sad. I've had to ship my computer into Apple (yet again). So I'll just be reading and formulating next steps for the models, controllers, and views until I receive a new machine and can actually build the next steps out. By the way, why do we call it MVC and not MCV (or even VCM)? I digress...

##Le DB SCHEMA
Okay! So I’ve spent a lot of time trying to figure out the most effiecient set up for my db schema! (Since I have nothing better to do without a working computer and all). <a href:'https://hackernoon.com/domain-driven-design-in-elixir-4dc416ac0a36'>Hackermoon</a> had a very interesting write up on aggreggate roots which shifted my approach the setting up the db schema. 

The set up I originally had was as follows:

``` 
  create_table "concept_joins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "concept_id"
    t.integer  "section_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "resource_links"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end


  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end
``` 

Now I dont think there is anything necessarily wrong with this set up, and I think it could work. But I consistently ask myself, “Is there a better way to do this?”. This question keeps me up at night seeing as how I am programming from a place of ignorance more often than not; I am perpetually worried I am doing something wrong. I dont mind being ignorant, I do mind staying ignorant. So that said, I chatted with some friends and I feel like I may have found a better way! Check me out:

``` 
  create_table "concepts", force: :cascade do |t|
  	t.integer  "user_id"
  	t.integer  "language_id"
  	t.integer  "section_id"
  	
    t.string   "title"
    t.string   "description"
    t.string   "resource_links"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end
 ``` 
 
 Thought process being I could use the concept table as the crux of the application (after all, “Concept Community” is the name of the application), and in that thought process having the concepts table connect the user, section and language tables. 
 
##Le Models & Associations

	 User 
	 	has_many :concepts
	 	has_many :sections, through: :concepts
	 	
	 Concept
	 	belongs_to :user
	 	belongs_to :section
	 	has_many :languages, through: :sections (or has one language?)
	 	
	 Section
	 	has_many :concepts
	 	has_many :users, through: :concepts
	 	has_many :languages
	 	
	 Language
	 	belongs_to :sections

##Le Routes.rb

I figure a decent starting point for routes.rb would be to have nested resources for concepts and obviously resources for User. I will definitely have to update it as I move along. 

		Rails.application.routes.draw do
		
		  devise_for :users
		
		  resources :games do
		    resources :concepts, only: [:create, :show, :destroy, :index]
		  end
		
		  resources :users, only: [:show]
		
		  root 'library#index'
		end


##Le Controllers

This is a very basic attempt at what will be needed for controllers. Based on what I know of Devise and OmniAuth I will need to build very specific controllers (and even models) to support functionality of either item through out the app. On a side note I, I really really do miss my computer. I will never take him for granted again. I may even buy him a twin sister so that I will never have to be with out a computer again. (hashtag: addiction).

### ConceptsController
	class ConceptsController < ApplicationController
	
	  def index
	    @concepts = Concept.all
	  end
	
	  def new
	    @concept = Concept.new
	  end
	
	  def create
	    @concept = current_user.concepts.build(concept_params)
	    if @concept.save
	      flash[:notice] = "Thank you for your submission. Concept successfully created!"
	      redirect_to user_path(current_user)
	    else
	      flash[:alert] = "Unfortunately your concept was not submitted."
	      render :new
	    end
	  end
	
	  def show
	    @concept = Concept.find(params[:id])
	  end
	
	  def edit
	    @concept = Concept.find(params[:id])
	  end
	
	  def update
	    @concept = Concept.find(params[:id])
	    if @concept.update(concept_params)
	      flash[:notice] = "Thank you for your update: Concept successfully updated."
	      redirect_to user_path(current_user)
	    else
	      flash[:alert] = "Edits to your concept were unsuccessful."
	      render :edit
	    end
	  end
	
	  def destroy
	    @concept = Concept.find(params[:id])
	    @concept.destroy
	    flash[:notice] = "Concept has been canned."
	    redirect_to user_path(current_user)
	  end
	
	  private
	  def concept_params
	  	params.require(:concept).permit(:title, :description, :resource_links)
	  end
	end
	
### SectionsController
	class SectionsController < ApplicationController
  
	  def show
	  	@section = Sections.all
	  end

	end

### UsersController

	class UsersController < ApplicationController
	
	  def show
	    @user = User.find(params[:id])
	  end
	
	  def user_concepts
	    @concepts = current_user.concepts.submitted_concepts
	  end	
	end

### LanguagesController
	class LanguagesController < ApplicationController
		On second thought, I am not sure that a languages controller is even necessary. I am considering making this and the Sections controller immutable. Furthermore the user will be able to sort concepts by the sections the belong to. I am not sure if I will make it so the user can sort anything by languages just yet.  Ill put some thought into this for a future iteration.
	end
	
	
##Le Views!
### /app/views/concepts
	_form_edit.html.erb
	_form.html.erb
	create.html.erb
	destroy.html.erb
	edit.html.erb
	index.html.erb
	new.html.erb
	show.html.erb
	update.html.erb
	
### /app/views/sections
	index.html.erb
	show.html.erb <--- Not sure if I will actually need this one, but I will figure that out soon. 

### /app/views/libraries
	index.html.erb
	
### /app/views/users
user_submitted.html.erb

### /app/views/devise
Simply based on past experiences I feel as though devise will need its own directory in which it will automagically do the things that need to be done. Stay tuned...


##R A N D O M THOUGHTS
One thought I am definitely having is that I would like static languages and sections table with regards to the database. Meaning Flatiron already has its sections laid out, so I will add those sections to my database and not give the user the option to add any thing else. Similarly, the languages that are affiliated with each section are pretty much set in stone. Now if Flatiron were to add a new section that tackled new languages I would be all for adding that in from an admins role. But there would be no need for a user to do that.

...Still no computer 😔
Ill never not have a computer again.

##Ideas for seeing projects
Keeping in mind, I have never seeded anything in an app before. But I am confident I will be able to figure it out. 

**Find PI to the Nth Digit** - Enter a number and have the program generate PI up to that many decimal places. Keep a limit to how far the program will go.

**Find e to the Nth Digit** - Just like the previous problem, but with e instead of PI. Enter a number and have the program generate e up to that many decimal places. Keep a limit to how far the program will go.

**Fibonacci Sequence** - Enter a number and have the program generate the Fibonacci sequence to that number or to the Nth number.

**Prime Factorization** - Have the user enter a number and find all Prime Factors (if there are any) and display them.

**Next Prime Number** - Have the program find prime numbers until the user chooses to stop asking for the next one.

**Find Cost of Tile to Cover W x H Floor** - Calculate the total cost of tile it would take to cover a floor plan of width and height, using a cost entered by the user.

**Mortgage Calculator** - Calculate the monthly payments of a fixed term mortgage over given Nth terms at a given interest rate. Also figure out how long it will take the user to pay back the loan. For added complexity, add an option for users to select the compounding interval (Monthly, Weekly, Daily, Continually).

**Change Return Program** - The user enters a cost and then the amount of money given. The program will figure out the change and the number of quarters, dimes, nickels, pennies needed for the change.

**Binary to Decimal and Back Converter** - Develop a converter to convert a decimal number to binary or a binary number to its decimal equivalent.

**Calculator** - A simple calculator to do basic operators. Make it a scientific calculator for added complexity.

**Unit Converter (temp, currency, volume, mass and more)** - Converts various units between one another. The user enters the type of unit being entered, the type of unit they want to convert to and then the value. The program will then make the conversion.

**Alarm Clock** - A simple clock where it plays a sound after X number of minutes/seconds or at a particular time.

**Distance Between Two Cities** - Calculates the distance between two cities and allows the user to specify a unit of distance. This program may require finding coordinates for the cities like latitude and longitude.

**Credit Card Validator** - Takes in a credit card number from a common credit card vendor (Visa, MasterCard, American Express, Discoverer) and validates it to make sure that it is a valid number (look into how credit cards use a checksum).

**Tax Calculator** - Asks the user to enter a cost and either a country or state tax. It then returns the tax plus the total cost with tax.

**Factorial Finder** - The Factorial of a positive integer, n, is defined as the product of the sequence n, n-1, n-2, ...1 and the factorial of zero, 0, is defined as being 1. Solve this using both loops and recursion.

**Complex Number Algebra** - Show addition, multiplication, negation, and inversion of complex numbers in separate functions. (Subtraction and division operations can be made with pairs of these operations.) Print the results for each operation tested.

**Happy Numbers** - A happy number is defined by the following process. Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers, while those that do not end in 1 are unhappy numbers. Display an example of your output here. Find first 8 happy numbers.

**Number Names** - Show how to spell out a number in English. You can use a preexisting implementation or roll your own, but you should support inputs up to at least one million (or the maximum value of your language's default bounded integer type, if that's less). *Optional: Support for inputs other than positive integers (like zero, negative integers, and floating-point numbers).*

**Coin Flip Simulation** - Write some code that simulates flipping a single coin however many times the user decides. The code should record the outcomes and count the number of tails and heads.

**Limit Calculator** - Ask the user to enter f(x) and the limit value, then return the value of the limit statement *Optional: Make the calculator capable of supporting infinite limits.*

**Fast Exponentiation** - Ask the user to enter 2 integers a and b and output a^b (i.e. pow(a,b)) in O(lg n) time complexity.

Classic Algorithms
-----------------

**Collatz Conjecture** - Start with a number *n > 1*. Find the number of steps it takes to reach one using the following process: If *n* is even, divide it by 2. If *n* is odd, multiply it by 3 and add 1.

**Sorting** - Implement two types of sorting algorithms: Merge sort and bubble sort.

**Closest pair problem** - The closest pair of points problem or closest pair problem is a problem of computational geometry: given *n* points in metric space, find a pair of points with the smallest distance between them.

**Sieve of Eratosthenes** - The sieve of Eratosthenes is one of the most efficient ways to find all of the smaller primes (below 10 million or so).

Data Structures
---------

**Inverted index** - An [Inverted Index](http://en.wikipedia.org/wiki/Inverted_index) is a data structure used to create full text search. Given a set of text files, implement a program to create an inverted index. Also create a user interface to do a search using that inverted index which returns a list of files that contain the query term / terms. The search index can be in memory.


Text
---------

**Fizz Buzz** - Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.

**Reverse a String** - Enter a string and the program will reverse it and print it out.

**Pig Latin** - Pig Latin is a game of alterations played on the English language game. To create the Pig Latin form of an English word the initial consonant sound is transposed to the end of the word and an ay is affixed (Ex.: "banana" would yield anana-bay). Read Wikipedia for more information on rules.

**Count Vowels** - Enter a string and the program counts the number of vowels in the text. For added complexity have it report a sum of each vowel found.

**Check if Palindrome** - Checks if the string entered by the user is a palindrome. That is that it reads the same forwards as backwards like “racecar”

**Count Words in a String** - Counts the number of individual words in a string. For added complexity read these strings in from a text file and generate a summary.

**Text Editor** - Notepad style application that can open, edit, and save text documents. *Optional: Add syntax highlighting and other features.*

**RSS Feed Creator** - Given a link to RSS/Atom Feed, get all posts and display them.

**Quote Tracker (market symbols etc)** - A program which can go out and check the current value of stocks for a list of symbols entered by the user. The user can set how often the stocks are checked. For CLI, show whether the stock has moved up or down. *Optional: If GUI, the program can show green up and red down arrows to show which direction the stock value has moved.*

**Guestbook / Journal** - A simple application that allows people to add comments or write journal entries. It can allow comments or not and timestamps for all entries. Could also be made into a shout box. *Optional: Deploy it on Google App Engine or Heroku or any other PaaS (if possible, of course).*

**Vigenere / Vernam / Ceasar Ciphers** - Functions for encrypting and decrypting data messages. Then send them to a friend.

**Regex Query Tool** - A tool that allows the user to enter a text string and then in a separate control enter a regex pattern. It will run the regular expression against the source text and return any matches or flag errors in the regular expression.


Networking
---------

**FTP Program** - A file transfer program which can transfer files back and forth from a remote web sever.

**Bandwidth Monitor** - A small utility program that tracks how much data you have uploaded and downloaded from the net during the course of your current online session. See if you can find out what periods of the day you use more and less and generate a report or graph that shows it.

**Port Scanner** - Enter an IP address and a port range where the program will then attempt to find open ports on the given computer by connecting to each of them. On any successful connections mark the port as open.

**Mail Checker (POP3 / IMAP)** - The user enters various account information include web server and IP, protocol type (POP3 or IMAP) and the application will check for email at a given interval.

**Country from IP Lookup** - Enter an IP address and find the country that IP is registered in. *Optional: Find the Ip automatically.*

**Whois Search Tool** - Enter an IP or host address and have it look it up through whois and return the results to you.

**Site Checker with Time Scheduling** - An application that attempts to connect to a website or server every so many minutes or a given time and check if it is up. If it is down, it will notify you by email or by posting a notice on screen.


Classes
---------

**Product Inventory Project** - Create an application which manages an inventory of products. Create a product class which has a price, id, and quantity on hand. Then create an *inventory* class which keeps track of various products and can sum up the inventory value.

**Airline / Hotel Reservation System** - Create a reservation system which books airline seats or hotel rooms. It charges various rates for particular sections of the plane or hotel. Example, first class is going to cost more than coach. Hotel rooms have penthouse suites which cost more. Keep track of when rooms will be available and can be scheduled.

**Company Manager** - Create an hierarchy of classes - abstract class Employee and subclasses HourlyEmployee, SalariedEmployee, Manager and Executive. Every one's pay is calculated differently, research a bit about it.
After you've established an employee hierarchy, create a Company class that allows you to manage the employees. You should be able to hire, fire and raise employees. 

**Bank Account Manager** - Create a class called Account which will be an abstract class for three other classes called CheckingAccount, SavingsAccount and BusinessAccount. Manage credits and debits from these accounts through an ATM style program.

**Patient / Doctor Scheduler** - Create a patient class and a doctor class. Have a doctor that can handle multiple patients and setup a scheduling program where a doctor can only handle 16 patients during an 8 hr work day.

**Recipe Creator and Manager** - Create a recipe class with ingredients and a put them in a recipe manager program that organizes them into categories like deserts, main courses or by ingredients like chicken, beef, soups, pies etc.

**Image Gallery** - Create an image abstract class and then a class that inherits from it for each image type. Put them in a program which displays them in a gallery style format for viewing.

**Shape Area and Perimeter Classes** - Create an abstract class called Shape and then inherit from it other shapes like diamond, rectangle, circle, triangle etc. Then have each class override the area and perimeter functionality to handle each shape type.

**Flower Shop Ordering To Go** - Create a flower shop application which deals in flower objects and use those flower objects in a bouquet object which can then be sold. Keep track of the number of objects and when you may need to order more.

**Family Tree Creator** - Create a class called Person which will have a name, when they were born and when (and if) they died. Allow the user to create these Person classes and put them into a family tree structure. Print out the tree to the screen.


Threading
---------

**Create A Progress Bar for Downloads** - Create a progress bar for applications that can keep track of a download in progress. The progress bar will be on a separate thread and will communicate with the main thread using delegates.

**Bulk Thumbnail Creator** - Picture processing can take a bit of time for some transformations. Especially if the image is large. Create an image program which can take hundreds of images and converts them to a specified size in the background thread while you do other things. For added complexity, have one thread handling re-sizing, have another bulk renaming of thumbnails etc.


Web
---------

**Page Scraper** - Create an application which connects to a site and pulls out all links, or images, and saves them to a list. *Optional: Organize the indexed content and don’t allow duplicates. Have it put the results into an easily searchable index file.*

**Online White Board** - Create an application which allows you to draw pictures, write notes and use various colors to flesh out ideas for projects. *Optional: Add feature to invite friends to collaborate on a white board online.*

**Get Atomic Time from Internet Clock** - This program will get the true atomic time from an atomic time clock on the Internet. Use any one of the atomic clocks returned by a simple Google search.

**Fetch Current Weather** - Get the current weather for a given zip/postal code. *Optional: Try locating the user automatically.*

**Scheduled Auto Login and Action** - Make an application which logs into a given site on a schedule and invokes a certain action and then logs out. This can be useful for checking web mail, posting regular content, or getting info for other applications and saving it to your computer.

**E-Card Generator** - Make a site that allows people to generate their own little e-cards and send them to other people. Do not use Flash. Use a picture library and perhaps insightful mottos or quotes.

**Content Management System** - Create a content management system (CMS) like Joomla, Drupal, PHP Nuke etc. Start small. *Optional: Allow for the addition of modules/addons.*

**Web Board (Forum)** - Create a forum for you and your buddies to post, administer and share thoughts and ideas.

**CAPTCHA Maker** - Ever see those images with letters a numbers when you signup for a service and then asks you to enter what you see? It keeps web bots from automatically signing up and spamming. Try creating one yourself for online forms.


Files
---------

**Quiz Maker** - Make an application which takes various questions from a file, picked randomly, and puts together a quiz for students. Each quiz can be different and then reads a key to grade the quizzes.

**Sort Excel/CSV File Utility** - Reads a file of records, sorts them, and then writes them back to the file. Allow the user to choose various sort style and sorting based on a particular field.

**Create Zip File Maker** - The user enters various files from different directories and the program zips them up into a zip file. *Optional: Apply actual compression to the files. Start with Huffman Algorithm.*

**PDF Generator** - An application which can read in a text file, html file or some other file and generates a PDF file out of it. Great for a web based service where the user uploads the file and the program returns a PDF of the file. *Optional: Deploy on GAE or Heroku if possible.*

**Mp3 Tagger** - Modify and add ID3v1 tags to MP3 files. See if you can also add in the album art into the MP3 file’s header as well as other ID3v2 tags.

**Code Snippet Manager** - Another utility program that allows coders to put in functions, classes or other tidbits to save for use later. Organized by the type of snippet or language the coder can quickly look up code. *Optional: For extra practice try adding syntax highlighting based on the language.*


Databases
---------

**SQL Query Analyzer** - A utility application which a user can enter a query and have it run against a local database and look for ways to make it more efficient.

**Remote SQL Tool** - A utility that can execute queries on remote servers from your local computer across the Internet. It should take in a remote host, user name and password, run the query and return the results.

**Report Generator** - Create a utility that generates a report based on some tables in a database. Generates a sales reports based on the order/order details tables or sums up the days current database activity.

**Event Scheduler and Calendar** - Make an application which allows the user to enter a date and time of an event, event notes and then schedule those events on a calendar. The user can then browse the calendar or search the calendar for specific events. *Optional: Allow the application to create re-occurrence events that reoccur every day, week, month, year etc.*

**Budget Tracker** - Write an application that keeps track of a household’s budget. The user can add expenses, income, and recurring costs to find out how much they are saving or losing over a period of time. *Optional: Allow the user to specify a date range and see the net flow of money in and out of the house budget for that time period.*

**TV Show Tracker** - Got a favorite show you don’t want to miss? Don’t have a PVR or want to be able to find the show to then PVR it later? Make an application which can search various online TV Guide sites, locate the shows/times/channels and add them to a database application. The database/website then can send you email reminders that a show is about to start and which channel it will be on.

**Travel Planner System** - Make a system that allows users to put together their own little travel itinerary and keep track of the airline / hotel arrangements, points of interest, budget and schedule.


Graphics and Multimedia
---------

**Slide Show** - Make an application that shows various pictures in a slide show format. *Optional: Try adding various effects like fade in/out, star wipe and window blinds transitions.*

**Stream Video from Online** - Try to create your own online streaming video player.

**Mp3 Player** - A simple program for playing your favorite music files. Add features you think are missing from your favorite music player.

**Watermarking Application** - Have some pictures you want copyright protected? Add your own logo or text lightly across the background so that no one can simply steal your graphics off your site. Make a program that will add this watermark to the picture. *Optional: Use threading to process multiple images simultaneously.*

**Turtle Graphics** - This is a common project where you create a floor of 20 x 20 squares. Using various commands you tell a turtle to draw a line on the floor. You have move forward, left or right, lift or drop pen etc. Do a search online for "Turtle Graphics" for more information. *Optional: Allow the program to read in the list of commands from a file.*

**GIF Creator** A program that puts together multiple images (PNGs, JPGs, TIFFs) to make a smooth GIF that can be exported. *Optional: Make the program convert small video files to GIFs as well.*