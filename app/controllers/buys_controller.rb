class BuysController < ApplicationController
  before_action :get_item, only: [:index, :create]

  def index
    cheack_item
  end

  def create
    @address = Address.new(address_params)
    @buys = Buy.new(item_id: buy_params[:item_id], user_id: current_user[:id])
    if @buys.valid?
      if @address.save
        pay_item
        @buys.save
      else
        render :index
      end
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:token, :item_id, :user_id)
  end

  def address_params
    params.permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 秘密鍵を設定
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: buy_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類
    )
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  def cheack_item
    return redirect_to root_path if current_user[:id] == @item[:user_id]
    return redirect_to root_path unless @item.buy.nil?
  end
end
