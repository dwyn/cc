class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  
  def index
    @sections = Section.all
  end

  def show
    
  end
end
