class WelcomeController < ApplicationController

	def index
		@user = User.all[0]
		@concept = @user.concepts.sample

		respond_to do |format|
      format.html {render :index}
			format.json {render json: @concept}
    end
	end

end