class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :show]
  before_action :move_to_index2, only: :edit

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item[:id])
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :state_id, :burden_id, :prefecture_id,
                                 :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return redirect_to root_path unless user_signed_in?
  end

  def move_to_index2
    @item = Item.find(params[:id])
    return redirect_to root_path unless current_user.id == @item.user.id
  end
end
