class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def allconcepts
    @user = User.find(current_user.id)
    @concepts = @user.concepts

    @three_concepts = []
    @three_concepts.push(@concepts[0..2])
    @remaining_concepts = @concepts.drop(3)

    respond_to do |format|
      format.html {render template: 'users/allconcepts'}
      format.json {render json: @remaining_concepts}
    end
  end

  def favorites
    @favorites = current_user.favorite_concepts
  end

  def user_params
    params.require(:user).permit(:id)
  end

end
