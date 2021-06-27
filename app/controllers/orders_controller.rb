class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]
  before_action :item_ordered, only: [:index, :create]
  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params[:order_shipping].permit(:postal_code, :delivery_area_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id,item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_ab59bee31dbb1bc84dd0142f"
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def item_ordered
    if @item.order.present?
      redirect_to root_path
    end
  end

  def move_to_root_path
    if current_user == @item.user
      redirect_to root_path
    end
  end

end
