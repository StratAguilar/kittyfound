class CatBreedsController < ApplicationController

	layout 'main'
  
  def index
  	@catbreeds = CatBreed.sorted
  end

  def new
  end

  def edit
  end

  def delete
  end
end
