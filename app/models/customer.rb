class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :address, presence: true
  validates :postal_code, presence: true, numericality: {only_integer: true},
                          length: { is: 7 }
  validates :address, presence: true,
                      length: { maximum: 100 }
  validates :phone_number, presence: true, numericality: {only_integer: true},
                          length: { minimum: 10, maximum: 11 }
  
  
    #注文機能
    has_many :orders, dependent: :destroy

    #カート機能
    has_many :cart_items, dependent: :destroy
    
    # 配送先
    has_many :shipping_addresses, dependent: :destroy
 
    def full_name
      "#{last_name} #{first_name}"
    end
end
