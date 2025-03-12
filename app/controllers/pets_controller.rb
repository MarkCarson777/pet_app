class PetsController < ApplicationController
  def index
    @pets = if params[:query].present?
              Pet.search_by_name_and_description(params[:query])
            else
              Pet.all
            end

    if request.xhr?
      render partial: 'pets/pets_list', locals: { pets: @pets }, layout: false
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end
end
