class ItemsController < ApplicationController

  before_action :authenticate_user!, only:[:new]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.order("created_at DESC")
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
  end

  def update
  end

  def destroy
    item = Tweet.find(params[:id])
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :user_id, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end