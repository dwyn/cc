class ConceptsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @concepts = Concept.all
  end

  def new
    @concept = Concept.new
    @section = @concept.sections.build
  end

  def create
    @concept = current_user.concepts.build(concept_params)
    if @concept.save
      flash[:notice] = "Thank you for your submission!"
      redirect_to concept_path(@concept)
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
    @concept = Concept.find(params[:id])
    @concept.destroy
    flash[:notice] = "Concept deletion successful"
    redirect_to user_path(current_user)
  end

  private

  def concept_params
    params.require(:concept).permit(:title, :description, :resource_links, section_ids:[]) #:sections_attributes =>[:section_id ]
  end

end
