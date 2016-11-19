class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :create_ransack_object

  def create_ransack_object
    @q = Product.ransack(params[:q])    
  end
end
