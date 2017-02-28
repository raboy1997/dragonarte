class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
  @images = Image
    if params[:tag]
      @images = Image.tagged_with(params[:tag]).paginate(:order =>"name ASC" ,:page => params[:page], :per_page => 6).search(params[:search])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @images }
        format.js
        ajax_respond format, :section_id => "image"
      end
    else
      @images = Image.paginate(:page => params[:page], :per_page => 6).search(params[:search])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @images}
        format.js
        ajax_respond format, :section_id => "image"
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
