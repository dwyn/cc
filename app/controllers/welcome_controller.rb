class WelcomeController < ApplicationController

	def index
		@concept = Concept.all.sample
		# if the user is signed in redirect to user home
	end

end