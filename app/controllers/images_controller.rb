class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    if params[:tag]
      @images = Image.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 6)
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @images }
        format.js
      end
    else
      @images = Image.paginate(:page => params[:page], :per_page => 6)
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @images}
        format.js
      end
    end
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
    params.require(:image).permit(:img  , :description , :tag_list )
  end
end
