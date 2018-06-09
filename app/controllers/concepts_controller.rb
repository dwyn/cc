class ConceptsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    if params[:user_id]
      @concepts = User.find(params[:user_id]).concepts
    else
      @concepts = Concept.all
    end
    
    redirect_to root_path
  end

  def new
    @concept = Concept.new
    # @sections = Section.all
  end

  def create
    # raise params.inspect
    @concept = current_user.concepts.build(concept_params)
    # binding.pry
    if @concept.save
      
      flash[:notice] = "Thank you for your submission!"
      redirect_to @concept #<--- CHECK REDIRECT 
    else
      flash[:alert] = "Unfortunately your concept was not saved."
      render :new
    end
  end

  def show
    @concept = Concept.find(params[:id])
  end

  def edit
    @concept = Concept.find(params[:id])
  end

  def update
    @concept = Concept.find(params[:id])
    if @concept.update(concept_params)
      flash[:notice] = "Thanks for the update!."
      redirect_to concept_path(@concept)
    else
      flash[:alert] = "Update unsuccessful."
      render :edit
    end
  end

  def destroy
    binding.pry
    @concept = Concept.find(params[:id])
    if @concept.destroy
      flash[:notice] = "Concept deletion successful"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Concept could not be deleted at this time!"
      render :show
    end
  end

  private

  def concept_params
    params.require(:concept).permit(
      :id,
      :title,
      :description,
      :resource_links,
      :section_ids => [],
      :sections_attributes => [:language_ids => []]
      )
  end

end
