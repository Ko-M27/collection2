class Product < ApplicationRecord
  belongs_to :user_buyer, class_name: 'User', :foreign_key => 'user_buyer_id', optional: true
  belongs_to :user_seller, class_name: 'User', :foreign_key => 'user_seller_id'
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images, :category, :text_1, :name, :price, :shipping_fee, presence: true
end
