class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order(id: "DESC")
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :condition_id, :delivery_charge_burden_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end




end
