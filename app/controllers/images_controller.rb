class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save
    if @image.save
      flash[:notice] = "Image add on site when the administrator approves this photo "
      redirect_to @image
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:img)
  end
end
