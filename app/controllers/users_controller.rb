class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @concepts = @user.concepts
  end
  
end
