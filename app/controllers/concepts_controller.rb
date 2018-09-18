class ConceptsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @user = User.find(current_user.id)
    @concepts = @user.concepts

    respond_to do |format|
      format.html {render :index}
      format.json {render json: @concepts}
    end
  end

  def new
    @user = current_user
    @concept = Concept.new
  end

  def favorites
    @favorite_concepts = Concept.favorited
  end

  def create
    binding.pry
    @user = User.find_by_id(params[:user_id])
    @concept = @user.concepts.build(concept_params)
    if @concept.save
      flash[:notice] = "Thank you for your submission!"
      redirect_to user_concept_path(@user, @concept) #<--- CHECK REDIRECT 
    else
      flash[:alert] = "Unfortunately your concept was not saved."
      render :new
    end
  end

  def show
    @user = current_user
    @concept = Concept.find(params[:id])
  end

  def edit
    @user = current_user
    @concept = Concept.find(params[:id])
  end

  def update
    @user = User.find_by_id(params[:user_id])
    @concept = Concept.find(params[:id])
    if @concept.update(concept_params)
      flash[:notice] = "Thanks for the update!."
      redirect_to user_concept_path(@concept)
    else
      flash[:alert] = "Update unsuccessful."
      render :edit
    end
  end

  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy
    flash[:notice] = "Concept deletion successful"
    redirect_to user_concepts_path(current_user)
  end

  private

  def concept_params
    params.require(:concept).permit(
      :title,
      :description,
      :favorited,
      :user_id,
      :section_id
      )
  end
end
