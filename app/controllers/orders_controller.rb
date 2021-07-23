class OrdersController < ApplicationController
   before_action :order_product,only:[:index,:create]
   before_action :authenticate_user!,only:[:index]
   before_action :redirect_purchase,only:[:index,:create]

  def index
    @order = Order.new
    
  end

    def create
      @order = Order.new(order_params)
      if @order.valid?
         pay_item
        @order.save
        return redirect_to root_path
      else
        render 'index'
      end
    end
  
    private

    def redirect_purchase
      if current_user == @product.user || @product.purchase_history.present?
        redirect_to root_path
      end
    end

    def order_params
      params.require(:order).permit(:postal_code, :from_city, :from_address, :building, :phone_number,  :prefecture_id,  ).merge(user_id: current_user.id, product_id: params[:product_id] )
    end
  
   def order_product
    @product = Product.find(params[:product_id])
   end

     def pay_item
      

       Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
         amount: @product.price,  # 商品の値段
         card: params[:token],    # カードトークン
         currency: 'jpy'                 # 通貨の種類（日本円）
       )
     end
  
end
