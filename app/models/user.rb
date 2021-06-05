class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A[a-z0-9]+\z/i }
  validates :first_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_hurigana, presence: true
  validates :last_name_hurigana, presence: true
  validates :birthday, presence: true

end
