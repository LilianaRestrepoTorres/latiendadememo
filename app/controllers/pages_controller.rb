class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def home
    @categories = Category.all
    if params[:category_id].present?
      @products = Category.find(params[:category_id]).products
      # @products = Product.where(category_id: params[:category_id])
    else
      @products = Product.all.shuffle[0..5]
    end
  end

  def profile
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    purchases = @user.purchases
    @paid_purchases = purchases.where(status: :paid)
    @pending_purchases = purchases.where(status: :pending)
  end

end
