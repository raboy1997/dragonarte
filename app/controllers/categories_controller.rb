class CategoriesController < ApplicationController
    def new
      @category = Category.new
    end

    def index
      @categories = Category.all
    end

    def create
      @category = Category.new(category_params)
      @category.save

    end

    def show
      @category = Category.find(:params[:id])
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end


end
