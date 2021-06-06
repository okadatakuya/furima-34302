class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }

  with_options presence: true do
    validates :nickname 
    validates :first_name 
    validates :last_name 
    validates :first_name_hurigana 
    validates :last_name_hurigana
    validates :birthday 
  end

end
