class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アウター' },
    { id: 3, name: 'トップス' },
    { id: 4, name: 'ボトム' },
    { id: 5, name: 'シューズ' },
    { id: 6, name: 'キャップ' },
    { id: 7, name: 'その他' },
 ]


  include ActiveHash::Associations
  has_many :items

  end