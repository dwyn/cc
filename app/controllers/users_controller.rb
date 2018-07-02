class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def allconcepts
    @user = User.find(current_user.id)
    @concepts = @user.concepts
    render template: 'users/allconcepts'
  end

  def favorites
    @favorites = current_user.favorite_concepts
  end

  def user_params
    params.require(:user).permit(:id)
  end

end
