class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @concepts = Concept.all
  end
  
end
