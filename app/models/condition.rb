class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品' },
    { id: 3, name: '新品未使用に近い' },
    { id: 4, name: '目立った傷、汚れなし' },
    { id: 5, name: '少し傷、汚れあり' },
    { id: 6, name: '傷、汚れあり' },
    { id: 7, name: '悪い' },
 ]


  include ActiveHash::Associations
  has_many :items

  end