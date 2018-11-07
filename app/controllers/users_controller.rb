class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    respond_to do |format|
      format.html {render :index}
      format.json {render json: @user}
    end
  end

  def user_params
    params.require(:user).permit(:id)
  end

end
