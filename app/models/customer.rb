class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    #注文機能
    has_many :orders, dependent: :destroy
    
    #カート機能
    has_many :cart_items, dependent: :destroy
end
