class WelcomeController < ApplicationController

	def index
		@concept = Concept.all.sample
		respond_to do |format|
      format.html {render :index}
			format.json {render json: @concepts.to_json(only: [:title, :description, :id])}
    end
	end

	# def random_concept
	# 	@concept = Concept.all.sample
	# 	render json: @concept.to_json(only: [:title, :description])
	# end

end