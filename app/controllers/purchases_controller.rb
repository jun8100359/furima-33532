class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, only: :new
  before_action :move_to_index2, only: :new

  def new
    @item = Item.find(params[:item_id])  
    @purchase_street_address = PurchaseStreetAddress.new

  end

  def create
    @purchase_street_address = PurchaseStreetAddress.new(purchase_params)
    if @purchase_street_address.valid?
      @purchase_street_address.save
      redirect_to root_path
    else
      @item = Item.find(purchase_params[:item_id])
      render action: :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_street_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user.id
  end

  def move_to_index2
    @item = Item.find(params[:item_id])
    return redirect_to root_path if @item.purchase
  end

end
