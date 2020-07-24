class ItemsController < ApplicationController
  before_action :check_login, only: [:new, :create, :edit, :update]
  before_action :get_item, only: [:show,:edit,:update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    check_user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :type_id, :burden_id, :prefecture_id, :day_id, :condition_id).merge(user_id: current_user.id)
  end

  def check_login
    redirect_to action: :index unless user_signed_in?
  end

  def get_item
    @item = Item.find(params[:id])
  end

  def check_user
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end
