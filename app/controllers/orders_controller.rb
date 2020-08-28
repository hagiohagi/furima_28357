class OrdersController < ApplicationController
  def new
    if user_signed_in?
      @order = OrderAddress.new
      @item = Item.find(params[:item_id])
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @user = User.find(@item.user_id)
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
