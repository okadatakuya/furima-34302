class OrderShipping
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :delivery_area_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id
  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Only 10 or 11" }
    validates :user_id
    validates :item_id
  end
  
  with_options numericality: { other_than: 1 } do
    validates :delivery_area_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
  
end