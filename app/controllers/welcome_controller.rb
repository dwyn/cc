class WelcomeController < ApplicationController

	def index
		@concept = Concept.all.sample
	end

	def random_concept
		@concept = Concept.all.sample
		render json: @concept.to_json(only: [:title, :description])
	end

end