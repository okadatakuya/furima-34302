class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge_burden
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :user
  
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name 
    validates :content 
    validates :category_id
    validates :condition_id 
    validates :delivery_charge_burden_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id 
    validates :delivery_charge_burden_id
    validates :delivery_area_id
    validates :delivery_day_id
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

end
