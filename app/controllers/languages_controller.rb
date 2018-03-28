class LanguagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
end
