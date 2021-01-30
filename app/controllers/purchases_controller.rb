class PurchasesController < ApplicationController

  def new
    @purchase_street_address = PurchaseStreetAddress.new
    @item = Item.find(params[:id])
  end

  def create
    @purchase_street_address = PurchaseStreetAddress.new(purchase_params)
    if @purchase_street_address.valid?
      @purchase_street_address.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  privete

  def purchase_params
    params.require(:puchase_street_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @purchase_street_address.item_id)
  end
  
end
