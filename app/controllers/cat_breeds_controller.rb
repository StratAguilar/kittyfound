class CatBreedsController < ApplicationController

	layout 'main'
  
  def index
  	@catbreeds = CatBreed.sorted
  end

  def new
     @catbreed = CatBreed.new()
  end

  def create 
    @catbreed = CatBreed.new(breed_params)
    if @catbreed.save
      flash[:notice] = "Breed successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @catbreed = CatBreed.find(params[:id])
  end

  def update

    @catbreed = CatBreed.find(params[:id])
    if @catbreed.update_attributes(breed_params)
      flash[:notice] = "Breed updated successfully"
      redirect_to(:action => 'index')

    else
      render('edit')
    end
  end 

  def delete

  end

  private

    def breed_params
      params.require(:catbreed).permit(:breed, :coat, :image)
    end

end
