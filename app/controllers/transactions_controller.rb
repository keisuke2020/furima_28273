class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.new(@item.price: item_params[:price])
    if @item.valid?
      pay_item
      @item.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_params
    params.permit(:@item.price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_96dbe48cc3a53f6dd17bc11d"
    Payjp::Charge.create(
      amount: item_params[:@item.price],
      card: item_params[:token],
      currency:'jpy'
    )
  end

end
