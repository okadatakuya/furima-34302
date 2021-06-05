class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /[a-z]{1,}[\d]{1,}/i }
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
