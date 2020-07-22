class ItemsController < ApplicationController
  before_action :check_login, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.permit(:name, :description, :image, :price, :type_id, :burden_id, :prefectures_id, :days_id, :condition_id).merge(user_id: current_user.id)
  end

  def check_login
    redirect_to action: :index unless user_signed_in?
  end
end
