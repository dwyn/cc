class WelcomeController < ApplicationController

	def index
		@concept = Concept.all.sample
	end

end