class ProductsController < ApplicationController
   before_action :set_product, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except: [:index,:show]

   before_action :move_to_index, except:[:index, :new, :create,:show]
  
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

    def show
      
    end
    
    def edit
    end

    def update
      if @product.update(product_params)      
        redirect_to product_path
      else
        render :edit
      end
    end

     def destroy
      @product.destroy
      redirect_to  root_path
     end

private
  def product_params
    params.require(:product).permit(:title, :image, :description, :category_id, :price, :status_id, :prefecture_id, :burden_id, :esd_id).merge(user_id: current_user.id)
  end

   def set_product
     @product = Product.find(params[:id])
   end

   def move_to_index
    
     unless @product.user_id == current_user.id
       redirect_to action: :index
     end
   end

end
