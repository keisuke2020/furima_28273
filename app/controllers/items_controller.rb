class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      authenticate_user!
    end
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
    params.require(:item).permit(:exhibition_image, :name, :product_explanation,
                                 :price, :category_id, :status_id, :origin_id, :charge_id, :delivery_id).merge(user_id: current_user.id)
  end
end
