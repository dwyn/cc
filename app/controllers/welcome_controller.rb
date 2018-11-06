class WelcomeController < ApplicationController

	def index
		@user = current_user
		@concept = @user.concepts.sample

		respond_to do |format|
      format.html {render :index}
			format.json {render json: @user}
    end
	end

end