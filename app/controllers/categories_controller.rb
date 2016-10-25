class CategoriesController < ApplicationController
  before_action :find_category, only: [ :edit, :update, :show, :destroy ]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'The category have been saved'
      redirect_to category_path(id: @category.id, it_was: 'created')
    else
      @errors = @category.errors
      render :new
    end
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully update.'
      redirect_to category_path(id: @category.id, it_was: 'updated')
    else
      render :edit
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category was successfully destroyed.'
    redirect_to categories_path
  end

  def show
    @action = params[:it_was]
  end

  private
  #Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description)
    end

    def find_category
      @category = Category.find(params[:id])
      @category = Category.find(params[:id])
    end
end
