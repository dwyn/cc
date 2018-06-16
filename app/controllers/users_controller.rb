class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @concepts = @user.concepts
  end

  def favorites
    @favorites = current_user.favorite_concepts
  end
  
end
