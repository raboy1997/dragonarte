class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def application
      if params[:tag]
        @images = Image.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 6)
      else
        @images = Image.paginate(:page => params[:page], :per_page => 6)
      end
  end


end
