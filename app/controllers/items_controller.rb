class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_item, only: [:show, :edit, :update, :destroy]

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
    params[:item_id] = params[:id]
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

  def destroy
    check_user
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, images: [], :price, :type_id, :burden_id, :prefecture_id, :day_id, :condition_id).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path if current_user.id != @item.user_id
  end
end
