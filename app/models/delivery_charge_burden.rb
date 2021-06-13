class DeliveryChargeBurden < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '出品者負担' },
    { id: 3, name: '購入者負担' },
    { id: 4, name: 'その他' }
 ]


  include ActiveHash::Associations
  has_many :items

  end