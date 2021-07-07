class ProductsController < ApplicationController
  # before_action :set_product, only:[:move_to_index]
  before_action :authenticate_user!, except: [:index]

  # before_action :move_to_index, except:[:index, :new, :create]
  
  def index
     @product = Product.includes(:user).order("created_at DESC")
  end
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

private
  def product_params
    params.require(:product).permit(:title, :image, :description, :category_id, :price, :status_id, :prefecture_id, :burden_id, :esd_id).merge(user_id: current_user.id)
  end

  # def set_product
  #   @product = Product.find(params[:id])
  # end

  # def move_to_index

  #   unless user_signed_in? && @product.user_id == current_user.id
  #     redirect_to action: :index
  #   end
  # end

end
