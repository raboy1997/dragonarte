class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    if params[:tag] && params[:categories].blank?
      @images = Image.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 6).search(params[:search])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @images }
        format.js
      end
    else
      @images = Image.paginate(:page => params[:page], :per_page => 6).search(params[:search]).where(category_id: @category_id)
      @category_id = Category.find_by(name: params[:category_id])

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
    else
      flash[:notice] = "Image dont add on site "

    end
  end

  def search
    @images = Image.where(description: params[:search] , category_id: params[:category].to_i)
  end

  def show
    @image = Image.find(params[:id])
  end


  private

  def image_params
    params.require(:image).permit(:img  , :description , :tag_list , :category_id )
  end
end
