class WelcomeController < ApplicationController

	def index
		@concept = Concept.all.sample

		respond_to do |format|
      format.html {render :index}
			format.json {render json: @concept}
    end
	end

end