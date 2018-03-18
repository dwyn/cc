class WelcomeController < ApplicationController

	def index
		@concepts = Concept.all
	end

end