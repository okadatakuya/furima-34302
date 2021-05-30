class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A[a-z0-9]+\z/i }
  validates :first_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }

end
