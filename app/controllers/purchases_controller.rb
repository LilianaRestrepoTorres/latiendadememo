class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    product = Product.find(params[:product_id])

    purchase = Purchase.new
    purchase.product = product
    purchase.user = current_user
    purchase.status = :pending
    purchase.price = product.price
    # Purchase.create(user_id: user.id, product_id: product.id, price: product.price, status: status)

    if product.available? && purchase.save
      product.update_stock
      flash[:notice] = 'Tu compra ha sido realizada con éxito '
    else
      flash[:alert] = 'No ha sido posible agregar este producto a tus compras, intenta de nuevo.'
    end

    redirect_to root_path(category_id: product.category_id)
  end

  def dashboard
    @users = User.all
  end
end
