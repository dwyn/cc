class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def user_submitted
    @concepts = current_user.concepts.submitted_games
  end

end
