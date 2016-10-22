class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'The product have been saved'
      redirect_to @product
    else
      @errors = @product.errors
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Product was successfully destroyed.'
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  #Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :reference, :price, :quantity, :brand, :description)
    end
end
