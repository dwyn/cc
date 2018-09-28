class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:id)
  end

end
