class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:new, :create]
  before_action :move_to_index, only: :new

  def new
    @purchase_street_address = PurchaseStreetAddress.new
  end

  def create
    @purchase_street_address = PurchaseStreetAddress.new(purchase_params)
    if @purchase_street_address.valid?
      card_pay
      @purchase_street_address.save
      redirect_to root_path
    else

      render action: :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_street_address).permit(:postal_code, :prefecture_id, :municipalities,
                                                    :address, :building, :phone_number, :item_id, :price).merge(
                                                      user_id: current_user.id, token: params[:token]
                                                    )
  end

  def move_to_index
    return redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def card_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
