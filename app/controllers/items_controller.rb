class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
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

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :product_explanation,
                                 :price, :category_id, :status_id, :origin_id, :charge_id, :delivery_id).merge(user_id: current_user.id)
  end
end
